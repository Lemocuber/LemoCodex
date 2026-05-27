#!/usr/bin/env bash
set -euo pipefail

input="$(cat)"
answers='{}'

count="$(jq '.questions | length' <<<"$input")"

ask_choice() {
  local header="$1"
  local question="$2"
  local choices="$3"

  /usr/bin/osascript \
    -e 'on run argv' \
    -e 'set headerText to item 1 of argv' \
    -e 'set questionText to item 2 of argv' \
    -e 'set oldDelims to AppleScript'\''s text item delimiters' \
    -e 'set AppleScript'\''s text item delimiters to linefeed' \
    -e 'set optionList to text items of (item 3 of argv)' \
    -e 'set AppleScript'\''s text item delimiters to oldDelims' \
    -e 'set picked to choose from list optionList with title headerText with prompt questionText' \
    -e 'if picked is false then return ""' \
    -e 'return item 1 of picked' \
    -e 'end run' \
    "$header" "$question" "$choices" \
    2>/dev/null
}

ask_other() {
  local header="$1"

  /usr/bin/osascript \
    -e 'on run argv' \
    -e 'text returned of (display dialog "Enter custom response:" with title (item 1 of argv) default answer "" buttons {"Cancel", "Submit"} default button "Submit" cancel button "Cancel")' \
    -e 'end run' \
    "$header" \
    2>/dev/null
}

for ((i = 0; i < count; i++)); do
  q="$(jq -c ".questions[$i]" <<<"$input")"

  id="$(jq -r '.id' <<<"$q")"
  header="$(jq -r '.header' <<<"$q")"
  question="$(jq -r '.question' <<<"$q")"

  choices="$(
    jq -r '.options[] | "\(.label) — \(.description)"' <<<"$q"
    echo "Other — Enter a custom response."
  )"

  while true; do
    picked="$(ask_choice "$header" "$question" "$choices")"

    if [[ -z "$picked" ]]; then
      answer="$(jq -nc \
        --arg choice "cancelled" \
        --arg note "User cancelled question prompt. Stop to ask what they want instead." \
        '{choice:$choice, note:$note}')"
      break
    elif [[ "$picked" == "Other — "* ]]; then
      if note="$(ask_other "$header")"; then
        answer="$(jq -nc \
          --arg choice "Other" \
          --arg note "$note" \
          '{choice:$choice, note:$note}')"
        break
      else
        continue
      fi
    else
      option="${picked%% — *}"
      answer="$(jq -nc \
        --arg choice "$option" \
        '{choice:$choice}')"
      break
    fi
  done

  answers="$(jq -c --arg id "$id" --argjson answer "$answer" '. + {($id): $answer}' <<<"$answers")"
done

jq -nc --argjson answers "$answers" '{answers:$answers}'

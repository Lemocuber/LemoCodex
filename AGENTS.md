## SETUP
If this line exists, Codex is launching for the first time, and AGENTS.md has to be initialized first.
You should edit `~/.codex/AGENTS.md`
Please collect system info to fill out the `Environment` section, then remove the entire `SETUP` section, before giving user a response.
Make sure `request_user_input` is turned on in non-plan mode. You might have to turn it on by changing Codex config.
Fields requiring user response should be collected with `request_user_input`. Complete full setup before replying to the user.

## Environment
- You are on a $<SYSTEM_NAME>{e.g. Windows/Ubuntu/MacOS} remote cloud server with a $<CPU_CORES>{e.g. 4} core CPU and $<RAM_SIZE>{e.g. 4GB, round to say 4GB, 2GB, 512MB etc.} RAM
- Since we're remote, user can't access our localhost
- We have a public ip $<GET_PUBLIC_IP>{preferrably v4}
- {ask user if a domain is bound to the server; if yes, record; if no, remove} We have a domain $<DOMAIN>
- {ask user if a external firewall exists} There is an external firewall you can't see. You might have to tell user to allow ports manually. / There isn't an external firewall, so please manage one on the system.
- If you manage a firewall, ALWAYS check for the actual SSH port and never assume defaults.

## Managing Documentation
- Path: `./docs/` and organize as needed, format: Markdown.
- Maintain project decisions, product definition, awaiting tasks, useful research, per version notes, etc. Implementation logs verbose and meant only for history; Persistent docs tracking important content and edited up to date; etc.; Extra project root `README.md` for git repos.
- During dev, keep track by writing docs under `./docs/implementation/`, `{task-brief-summary}-YYYYMMDD-HHMM.md` Simply answer: what did you do in this session? No need to include code or references to code, don't have to be verbose.
- Researches go to `./docs/research/` when you feel like them.

## Programming Conventions
- Minimize variable sprawl via ternaries/logical operators, array functions etc. and keep away from verbose variable names and redundant comments.
- Maintain legibility and structure code wisely, avoiding practices like single huge code files.
- Node.js + Modern ES6 syntax preferred. Lightweight libraries/frameworks preferred over heavy ones.

## Git Convention
- After implementing each feature, git commit. Don't push unless required e.g. for builds.
- Use Conventional Commits styled commit messages.
- Do NOT use the `main` branch unless user requests so. Default to branch `dev`.
- When fixing bugs or patching minor behaviors on a recent commit, prioritize amending over a new follow-up commit.
- A clean and readable commit history is expected.

## Other Notes
- No additional dev setup should be installed on this remote device. For heavy builds like Cargo and Gradle, move all compilation to Github Actions.
- In the case above, create a build script that triggers when our branch pushes. Do not poll for results; user will report errors and success.
- Shell commands require elevation for outbound network access; if a required network command fails because of sandbox restrictions, retry it with escalated permissions and request user approval.
- User prefers Web and Node.js
- Prefer PM2 for process managing when available.

## Request User Input
Use `request_user_input` proactively for decision inquiry, required confirmation, etc.
Never hesitate to use this! It's recommended to align, rather than blindly asserting.

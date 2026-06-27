# Module 1 Assignment — Version Control using Git and GitHub

> **Topic:** Commit, Branching, Merging, and Pull Requests
> **Format:** Step-by-step hands-on tutorial with commands, explanations, and expected outputs.

This tutorial walks you through the **entire assignment** from an empty folder to a public GitHub repository with a merged Pull Request. Follow the steps in order. Every command is shown in a code block — copy, paste, adapt, and run.

---

## 📋 Table of Contents

0. [Prerequisites](#0-prerequisites)
1. [Set Up a Local Git Repository](#1-set-up-a-local-git-repository)
2. [Create a New GitHub Repository](#2-create-a-new-github-repository)
3. [Branching](#3-branching)
4. [Pushing the New Branch](#4-pushing-the-new-branch)
5. [Create a Pull Request](#5-create-a-pull-request)
6. [Merge the Pull Request](#6-merge-the-pull-request)
7. [Submission Instructions](#7-submission-instructions)
8. [Quick Command Cheat Sheet](#8-quick-command-cheat-sheet)
9. [Troubleshooting](#9-troubleshooting)

---

## 0. Prerequisites

Before you begin, make sure the following are installed and configured.

### 0.1 Install Git

Download Git from **<https://git-scm.com/downloads>** and install it.

Verify the installation:

```bash
git --version
```

Expected output (version may differ):

```
git version 2.45.1
```

### 0.2 Configure your Git identity

This **must** be done once per machine. The name/email you set here is stamped on every commit.

```bash
git config --global user.name "Your Full Name"
git config --global user.email "you@example.com"
git config --global init.defaultBranch main
git config --global pull.rebase false
```

Verify:

```bash
git config --global --list
```

### 0.3 Create a GitHub account

Sign up at **<https://github.com>** (free). Use the **same email** you configured above so GitHub can link your commits to your profile.

### 0.4 Authenticate Git with GitHub

The modern, secure way is the **GitHub CLI** or a **Personal Access Token (PAT)**.

**Option A — GitHub CLI (recommended):**

```bash
# macOS (Homebrew)
brew install gh

# Authenticate
gh auth login
```

Follow the interactive prompts: choose **GitHub.com → HTTPS → Login with a web browser**.

**Option B — Personal Access Token:**

1. Go to <https://github.com/settings/tokens> → **Generate new token (classic)**.
2. Tick the `repo` scope.
3. Copy the token — you'll use it as your password when pushing.

---

## 1. Set Up a Local Git Repository

**Goal:** Initialize a Git repo, create `README.md`, and make your first commit.

### 1.1 Create and enter your project folder

```bash
mkdir my-git-project
cd my-git-project
```

> 💡 Replace `my-git-project` with any meaningful name (e.g., `devops-module1-assignment`).

### 1.2 Initialize the Git repository

```bash
git init
```

Expected output:

```
Initialized empty Git repository in /Users/you/my-git-project/.git/
```

A hidden `.git/` folder is created — this is the "brain" of your repository. **Never edit it manually.**

### 1.3 Create the `README.md` file

```bash
cat > README.md << 'EOF'
# My Git & GitHub Assignment

This repository demonstrates core Git and GitHub workflows:
- Initializing a local repository
- Committing changes
- Branching
- Opening and merging a Pull Request

## Author
Your Name — Batch 13, Module 1
EOF
```

Or simply create the file in your editor and paste:

```markdown
# My Git & GitHub Assignment

This repository demonstrates core Git and GitHub workflows:
- Initializing a local repository
- Committing changes
- Branching
- Opening and merging a Pull Request

## Author
Your Name — Batch 13, Module 1
```

### 1.4 Check the repository status

```bash
git status
```

You should see `README.md` listed under **"Untracked files"** (in red).

### 1.5 Stage the file

"Staging" tells Git: *"I want this change in my next commit."*

```bash
git add README.md
```

Stage everything (useful for larger projects):

```bash
git add .
```

Verify with `git status` — `README.md` should now be **green** under "Changes to be committed".

### 1.6 Commit the file

A commit is a **snapshot** of your project at a moment in time, with a message explaining the change.

```bash
git commit -m "Add README with project description"
```

Expected output:

```
[main (root-commit) a1b2c3d] Add README with project description
 1 file changed, 12 insertions(+)
 create mode 100644 README.md
```

### 1.7 View the commit history

```bash
git log --oneline
```

Expected:

```
a1b2c3d (HEAD -> main) Add README with project description
```

✅ **Step 1 complete.** You now have a local repo with one commit.

---

## 2. Create a New GitHub Repository

**Goal:** Create a remote repository on GitHub and push your local commits.

### 2.1 Create the repository on GitHub

**Option A — Using the GitHub website:**

1. Go to <https://github.com/new>.
2. **Repository name:** `my-git-project` (match your local folder).
3. **Description:** *(optional)* e.g., "DevOps Batch 13 — Module 1 Git/GitHub assignment".
4. Choose **Public**.
5. **DO NOT** tick "Add a README" or ".gitignore" — your local repo already has a README. Adding files remotely causes conflicts.
6. Click **Create repository**.

**Option B — Using the GitHub CLI (faster):**

```bash
gh repo create my-git-project --public --source=. --remote=origin --description "DevOps Module 1 Git/GitHub assignment"
```

This creates the repo **and** links it in one step — skip to step **2.3** if you used this.

### 2.2 Link your local repo to the remote (Option A only)

Copy the URL from GitHub (it looks like `https://github.com/USERNAME/my-git-project.git`), then:

```bash
git remote add origin https://github.com/USERNAME/my-git-project.git
```

Verify the remote was added:

```bash
git remote -v
```

Expected:

```
origin  https://github.com/USERNAME/my-git-project.git (fetch)
origin  https://github.com/USERNAME/my-git-project.git (push)
```

> 🔑 If prompted, use your **GitHub username** and your **Personal Access Token** as the password (not your GitHub login password).

### 2.3 Push local commits to GitHub

```bash
git push -u origin main
```

- `-u` (short for `--set-upstream`) remembers the link between local `main` and remote `origin/main`. Future pushes just need `git push`.
- If your default branch is `master` instead of `main`, rename it first:
  ```bash
  git branch -M main
  ```

Expected output:

```
Enumerating objects: 3, done.
...
 * [new branch]      main -> main
```

Refresh your repository page on GitHub — your `README.md` and commit should appear. ✅

---

## 3. Branching

**Goal:** Create a `dev` branch, add `hello.txt`, and commit it — all without touching `main`.

> 🌿 **Why branch?** A branch is an independent line of work. You can experiment on `dev` while `main` stays stable. This is the foundation of collaborative development.

### 3.1 Create and switch to the `dev` branch

```bash
git checkout -b dev
```

- `-b` creates the branch, then `checkout` switches to it.
- Modern alternative (same result):
  ```bash
  git switch -c dev
  ```

Confirm you're on `dev`:

```bash
git branch
```

Expected (the `*` marks your current branch):

```
* dev
  main
```

### 3.2 Create `hello.txt`

```bash
echo "Hello from the dev branch! 👋" > hello.txt
```

Verify:

```bash
cat hello.txt
```

### 3.3 Stage and commit

```bash
git add hello.txt
git commit -m "Add hello.txt greeting file"
```

Check history:

```bash
git log --oneline --graph --all
```

Expected:

```
* def4567 (HEAD -> dev) Add hello.txt greeting file
* a1b2c3d (origin/main, main) Add README with project description
```

> Notice how `dev` now has one commit that `main` does not yet have. ✅

---

## 4. Pushing the New Branch

**Goal:** Push `dev` to GitHub and confirm it's visible.

### 4.1 Push the branch

```bash
git push -u origin dev
```

Expected output:

```
...
 * [new branch]      dev -> dev
```

### 4.2 Verify on GitHub

1. Open your repository on GitHub.
2. Click the **branch dropdown** (says `main` by default, top-left of the file list).
3. You should now see **`dev`** listed. Select it — you'll see `hello.txt` there.

✅ **Step 4 complete.** The branch is now on the remote.

---

## 5. Create a Pull Request

**Goal:** Request that `dev` be merged into `main`, with a clear description.

> 🔀 A **Pull Request (PR)** is a proposal: *"Please review my changes on this branch and merge them into the main branch."*

### 5.1 Open the Pull Request (website)

1. Go to your repository on GitHub.
2. Click the **"Pull requests"** tab → green **"New pull request"** button.
3. **Base:** `main` ← **Compare:** `dev`.
4. GitHub shows the diff (`hello.txt` added). Click **"Create pull request"**.

### 5.2 Write a descriptive PR

Use a clear title and a structured description. Example:

**Title:**

```
Add hello.txt greeting file
```

**Description:**

```markdown
## What does this PR do?
Adds a new `hello.txt` file on the `dev` branch containing a greeting message.

## Why
Demonstrates the branching workflow:
- Create a feature branch (`dev`)
- Make and commit isolated changes
- Merge them back into `main` via pull request

## Changes
- ➕ Added `hello.txt`

## Checklist
- [x] Commit message is descriptive
- [x] Branch name is meaningful (`dev`)
- [x] No secrets or sensitive data included
```

Click **"Create pull request"**.

### 5.3 (Alternative) Create the PR from the CLI

```bash
gh pr create \
  --base main \
  --head dev \
  --title "Add hello.txt greeting file" \
  --body "Adds a greeting file to demonstrate the branching + PR workflow."
```

✅ **Step 5 complete.** Your PR is open and awaiting review/merge.

---

## 6. Merge the Pull Request

**Goal:** Merge `dev` into `main` on GitHub, then sync your local `main`.

### 6.1 Merge on GitHub

1. Open your **Pull request** on GitHub.
2. If there are no conflicts, you'll see a green **"Merge pull request"** button. Click it.
3. Optionally edit the merge commit message, then click **"Confirm merge"**.
4. You can now **delete the `dev` branch** (GitHub offers a button) since its work is complete — optional but tidy.

### 6.2 Update your local `main`

Back in your terminal, switch to `main` and pull the merged changes:

```bash
git checkout main
git pull origin main
```

Expected:

```
Updating a1b2c3d..def4567
Fast-forward
 hello.txt | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 hello.txt
```

Verify `hello.txt` is now on `main` locally:

```bash
ls
cat hello.txt
git log --oneline
```

### 6.3 (Optional) Clean up the merged branch

If you deleted `dev` on GitHub, remove it locally too:

```bash
git branch -d dev               # delete local branch
git fetch --prune               # delete stale remote-tracking refs
```

✅ **Step 6 complete.** Your local and remote `main` are in sync, and the feature work is merged.

---

## 7. Submission Instructions

### 7.1 Make sure the repository is public

1. Go to your repo's **Settings** (the gear icon, top-right of the repo page).
2. Scroll to the bottom → **Danger Zone** → **Change visibility** → ensure it says **Public**.

### 7.2 Copy your repository URL

It looks like:

```
https://github.com/USERNAME/my-git-project
```

### 7.3 Submit

Submit this link per your course's instructions (LMS, email, etc.).

### 7.4 Checklist before submitting

- [x] Repository is **public**.
- [x] Initial commit with `README.md` exists on `main`.
- [x] A `dev` branch was created with `hello.txt`.
- [x] A **descriptive Pull Request** was opened from `dev` → `main`.
- [x] The PR was **merged** into `main`.
- [x] Commit messages and branch names are meaningful.
- [x] Local `main` is up to date with remote `main`.

---

## 8. Quick Command Cheat Sheet

| Task | Command |
|------|---------|
| Initialize a repo | `git init` |
| Stage all changes | `git add .` |
| Stage one file | `git add filename` |
| Commit | `git commit -m "message"` |
| Check status | `git status` |
| View history | `git log --oneline --graph --all` |
| Create + switch branch | `git checkout -b branchname` |
| Switch branch | `git checkout branchname` |
| Link remote | `git remote add origin <url>` |
| First push | `git push -u origin main` |
| Push branch | `git push -u origin branchname` |
| Pull updates | `git pull origin main` |
| Clone a repo | `git clone <url>` |
| List branches | `git branch` |
| Delete local branch | `git branch -d branchname` |
| Create PR (CLI) | `gh pr create` |
| View remotes | `git remote -v` |

---

## 9. Troubleshooting

### "Please tell me who you are"
Run the `git config --global user.name`/`user.email` commands from **Prerequisites 0.2**.

### Authentication failed when pushing
- You likely need a **Personal Access Token**, not your GitHub password.
- Or run `gh auth login` with the GitHub CLI.
- On macOS, cache credentials with: `git config --global credential.helper osxkeychain`.

### "fatal: refusing to merge unrelated histories"
This happens if your remote already had commits. Fix with:
```bash
git pull origin main --allow-unrelated-histories
```

### Merge conflict in a PR
1. Pull the target branch: `git pull origin main`
2. Open the conflicting file — look for `<<<<<<<`, `=======`, `>>>>>>>`
3. Resolve manually, then:
   ```bash
   git add .
   git commit -m "Resolve merge conflict"
   git push
   ```

### Wrong commit message
```bash
git commit --amend -m "New improved message"
git push --force-with-lease
```

### Accidentally committed on `main` instead of a branch
```bash
git branch dev          # create branch from current commit
git reset --hard HEAD~1 # move main back one commit
git checkout dev        # your commit is safe on dev
```

---

## 🎉 Congratulations!

You've completed the full Git & GitHub workflow: **init → commit → remote → branch → push → pull request → merge**. This is the exact workflow used by professional development teams every day.

**Key takeaways:**
- **Commit early, commit often** — small, descriptive commits are easier to review and rollback.
- **Branch for every feature** — keep `main` stable.
- **Pull requests are for communication** — describe *what* and *why*, not just *how*.
- **Pull before you push** — keep local and remote in sync.
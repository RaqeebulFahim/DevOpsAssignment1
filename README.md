# DevOps Batch 13 — Module 1 Tutorial

### Version Control with Git & GitHub: Commit, Branching, Merging, and Pull Requests

A complete, beginner-friendly tutorial package that walks you through the entire
Module 1 assignment — from an empty folder to a public GitHub repository with a
merged Pull Request.

---

## 📚 What's Inside

| File | Purpose |
|------|---------|
| [`TUTORIAL.md`](./TUTORIAL.md) | **Start here.** The full step-by-step tutorial covering all 7 assignment steps, with commands, expected output, and explanations. |
| [`docs/WORKFLOW_DIAGRAM.md`](./docs/WORKFLOW_DIAGRAM.md) | Visual diagrams (ASCII + Mermaid) of the Git workflow, the three states of Git, and the PR lifecycle. |
| [`docs/PULL_REQUEST_TEMPLATE.md`](./docs/PULL_REQUEST_TEMPLATE.md) | A reusable, professional PR description template you can copy into your own repo. |
| [`scripts/quickstart.sh`](./scripts/quickstart.sh) | An optional automation script that scaffolds the **local** portion of the assignment (Steps 1 & 3) in seconds. |

---

## 🚀 Quick Start (3 ways)

### Option A — Read & follow along (recommended for learning)
Open [`TUTORIAL.md`](./TUTORIAL.md) and follow each step in your own terminal.

### Option B — Use the quickstart script, then finish on GitHub
```bash
# 1. Scaffold the local repo (creates folder, README, dev branch, hello.txt)
chmod +x scripts/quickstart.sh
./scripts/quickstart.sh "my-git-project"

# 2. Then follow the "Next steps" the script prints (remote, push, PR, merge)
```

### Option C — Just review the concepts
Browse [`docs/WORKFLOW_DIAGRAM.md`](./docs/WORKFLOW_DIAGRAM.md) for the visual
mental model of branching, merging, and pull requests.

---

## 🗺️ Assignment Roadmap

```
 Step 1  Local repo + first commit (README.md)        ──▶  TUTORIAL §1
 Step 2  Create GitHub repo + push                     ──▶  TUTORIAL §2
 Step 3  Create `dev` branch + hello.txt + commit      ──▶  TUTORIAL §3
 Step 4  Push `dev` to GitHub                          ──▶  TUTORIAL §4
 Step 5  Open a descriptive Pull Request               ──▶  TUTORIAL §5
 Step 6  Merge the PR + sync local main                ──▶  TUTORIAL §6
 Step 7  Make repo public & submit the link            ──▶  TUTORIAL §7
```

---

## ✅ Deliverables Checklist

After completing the tutorial you should have:

- [x] A **public** GitHub repository.
- [x] An **initial commit** containing `README.md` on `main`.
- [x] A **`dev` branch** containing `hello.txt`.
- [x] A **descriptive Pull Request** from `dev` → `main`.
- [x] The PR **merged** into `main`.
- [x] Meaningful commit messages and branch names throughout.

---

## 🧰 Prerequisites

- **Git** installed → <https://git-scm.com/downloads>
- A free **GitHub** account → <https://github.com>
- *(Optional but recommended)* **GitHub CLI** → `brew install gh`

Full setup instructions are in [`TUTORIAL.md` §0 Prerequisites](./TUTORIAL.md#0-prerequisites).

---

## 🆘 Need Help?

- Common errors and fixes → [`TUTORIAL.md` §9 Troubleshooting](./TUTORIAL.md#9-troubleshooting)
- Command reference table → [`TUTORIAL.md` §8 Cheat Sheet](./TUTORIAL.md#8-quick-command-cheat-sheet)

---

<sub>Tutorial package prepared for DevOps Batch 13 · Module 1 Assignment.</sub>
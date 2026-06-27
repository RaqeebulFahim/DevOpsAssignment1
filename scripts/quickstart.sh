#!/usr/bin/env bash
# =============================================================================
# quickstart.sh — Scaffold the LOCAL portion of the Module 1 Git assignment.
#
# What this script does (steps 1, 3, and the local parts of 4 & 6):
#   1. Creates a new project folder + initializes a Git repository
#   2. Adds README.md and makes the first commit
#   3. Creates a `dev` branch, adds hello.txt, and commits it
#   4. Prints the commit graph so you can verify the branching
#
# What it does NOT do (you must do these manually):
#   - Create the GitHub repository
#   - Link the remote (git remote add)
#   - Push branches
#   - Open and merge the Pull Request on GitHub
#
# Usage:
#   chmod +x scripts/quickstart.sh
#   ./scripts/quickstart.sh "my-git-project"
#
#   (If no name is given, it defaults to "devops-module1-assignment".)
# =============================================================================

set -euo pipefail

# --- Colors ------------------------------------------------------------------
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

info()  { echo -e "${BLUE}[INFO]${NC}  $*"; }
ok()    { echo -e "${GREEN}[OK]${NC}    $*"; }
warn()  { echo -e "${YELLOW}[WARN]${NC}  $*"; }
fail()  { echo -e "${RED}[ERROR]${NC} $*"; exit 1; }

# --- Preflight checks --------------------------------------------------------
command -v git >/dev/null 2>&1 || fail "Git is not installed. See TUTORIAL.md section 0.1."
git config --global user.name  >/dev/null 2>&1 || fail "Git user.name not set. Run: git config --global user.name \"Your Name\""
git config --global user.email >/dev/null 2>&1 || fail "Git user.email not set. Run: git config --global user.email \"you@example.com\""

# --- Determine project name --------------------------------------------------
PROJECT_NAME="${1:-devops-module1-assignment}"

# Refuse to run inside an existing repo (avoid clobbering work)
if [ -d "$PROJECT_NAME/.git" ]; then
  fail "Directory '$PROJECT_NAME' already contains a Git repository. Pick a different name or delete it first."
fi

info "Creating project: $PROJECT_NAME"
mkdir -p "$PROJECT_NAME"
cd "$PROJECT_NAME"
ok "Entered $(pwd)"

# =============================================================================
# STEP 1 — Initialize local repository + first commit
# =============================================================================
info "Step 1: Initializing Git repository..."
git init -q
git branch -M main 2>/dev/null || true   # ensure default branch is 'main'
ok "Git initialized on branch 'main'"

info "Step 1: Creating README.md..."
cat > README.md << 'EOF'
# DevOps Module 1 — Git & GitHub Assignment

This repository was scaffolded by `quickstart.sh` and demonstrates:
- Local repository initialization
- Meaningful commits
- Branching (`dev`)
- A Pull Request workflow

## Author
<Your Name> — DevOps Batch 13
EOF
ok "README.md created"

info "Step 1: Staging + committing README.md..."
git add README.md
git commit -q -m "Add README with project description"
ok "First commit created"

# =============================================================================
# STEP 3 — Branching: create dev, add hello.txt, commit
# =============================================================================
info "Step 3: Creating and switching to 'dev' branch..."
git checkout -q -b dev
ok "Now on branch 'dev'"

info "Step 3: Creating hello.txt..."
echo "Hello from the dev branch! 👋" > hello.txt
ok "hello.txt created"

info "Step 3: Staging + committing hello.txt..."
git add hello.txt
git commit -q -m "Add hello.txt greeting file"
ok "Committed hello.txt on 'dev'"

# Switch back to main so the user is in a clean starting state for pushing
git checkout -q main
ok "Switched back to 'main' (ready to link remote & push)"

# =============================================================================
# Summary
# =============================================================================
echo
echo -e "${GREEN}==========================================================${NC}"
echo -e "${GREEN} ✅  Local scaffold complete!${NC}"
echo -e "${GREEN}==========================================================${NC}"
echo
echo -e "Project folder : ${BLUE}$(pwd)${NC}"
echo -e "Branches       : ${BLUE}$(git branch | tr -d ' ' | paste -sd, -)${NC}"
echo
echo -e "${YELLOW}Commit graph:${NC}"
git log --oneline --graph --all
echo
echo -e "${YELLOW}Next steps (do these manually):${NC}"
echo -e "  1. Create a public repo on GitHub named: ${BLUE}$PROJECT_NAME${NC}"
echo -e "     (do NOT add a README/.gitignore there)"
echo -e "  2. Link the remote:"
echo -e "     ${BLUE}git remote add origin https://github.com/<USERNAME>/$PROJECT_NAME.git${NC}"
echo -e "  3. Push main:"
echo -e "     ${BLUE}git push -u origin main${NC}"
echo -e "  4. Push the dev branch:"
echo -e "     ${BLUE}git checkout dev && git push -u origin dev${NC}"
echo -e "  5. Open + merge a Pull Request (dev → main) on GitHub"
echo -e "  6. Sync local main:"
echo -e "     ${BLUE}git checkout main && git pull origin main${NC}"
echo
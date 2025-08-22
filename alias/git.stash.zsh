# Git Stash Aliases - 100 aliases using dot notation
# Add these to your ~/.bashrc, ~/.zshrc, or ~/.bash_aliases file

# Basic stash operations
alias git.stash="git stash"
# Creates a snapshot of your current working directory and staged changes, then reverts 
# your working directory to match the last commit (HEAD). This is the most basic stash 
# command - equivalent to "git stash push". Use when you need to quickly save your work 
# and get a clean working directory.

alias git.stash.push="git stash push"
# Explicitly saves your local modifications to a new stash entry and rolls them back to HEAD.
# This is the modern recommended way to stash changes. The working tree and index are both 
# cleaned. You can add options like -m for messages, -u for untracked files, etc.

alias git.stash.save="git stash save"
# DEPRECATED command that saves changes to stash with an optional message. Unlike "push",
# this cannot take pathspecs to stash only specific files. All non-option arguments become
# part of the stash message. Use "git stash push" instead for new scripts.

alias git.stash.pop="git stash pop"
# Removes the most recent stash from the stash list AND applies its changes to your current
# working directory. This is destructive - if the pop succeeds, the stash is gone forever.
# If there are conflicts, the stash remains in the list and you must resolve conflicts manually,
# then run "git stash drop" to remove it.

alias git.stash.apply="git stash apply"
# Applies the changes from the most recent stash to your current working directory BUT
# keeps the stash in the stash list. This is safer than pop because you can apply the same
# stash multiple times or to different branches. Use this when you want to test applying
# a stash without losing it.

alias git.stash.drop="git stash drop"
# Permanently deletes the most recent stash entry from the stash list. This is irreversible
# under normal circumstances. Use after successfully applying a stash with "git stash apply"
# or when you no longer need a stash. Be careful - dropped stashes can only be recovered
# with advanced git forensics.

alias git.stash.clear="git stash clear"
# DANGEROUS: Permanently deletes ALL stash entries. This removes every stash you've ever
# created. Only use this when you're absolutely sure you don't need any of your stashes.
# There's no undo for this operation. Consider using "git stash drop" for individual stashes
# instead.

alias git.stash.list="git stash list"
# Shows all your current stash entries with their indices and descriptions. Each stash is
# shown as "stash@{0}: WIP on branch: commit-hash commit-message". The most recent stash
# is stash@{0}, second most recent is stash@{1}, etc. Use this to see what stashes you
# have available before applying or dropping them.

alias git.stash.show="git stash show"
# Displays a summary of changes in the most recent stash, showing which files were modified
# and how many lines were added/removed (diffstat format). By default shows only a summary,
# but you can add -p to see the full patch, or specify a different stash like "stash@{1}".
# This lets you inspect what's in a stash before applying it.

alias git.stash.branch="git stash branch"
# Creates a new branch starting from the commit where the stash was originally created,
# then applies the stash to that branch. This is useful when the current branch has
# diverged so much that applying the stash causes conflicts. The new branch will have
# the exact state where the stash was created, so conflicts are impossible.

# Quick shortcuts - Ultra-short aliases for frequent operations
alias git.s="git stash"
# Shortest possible stash command. Instantly saves all your working directory changes
# and gives you a clean slate. Perfect for when you need to quickly switch contexts
# or pull updates. Equivalent to typing "git stash" but with just 5 characters.

alias git.sp="git stash push"
# Short form of stash push. Use when you want the modern explicit stash command
# but don't want to type the full thing. Functionally identical to git.s but makes
# it clear you're using the "push" variant.

alias git.spo="git stash pop"
# Short form combining "stash" and "pop". Quickly restores your most recent stash
# and removes it from the stash list in one command. Use when you know you want
# to permanently restore and remove a stash.

alias git.sa="git stash apply"
# Short form for stash apply. Quickly restores your most recent stash but keeps it
# in the stash list for safety. Use when you want to test restoring a stash without
# losing the ability to apply it again later.

alias git.sl="git stash list"
# Quick way to see all your stashes. Essential for checking what stashes you have
# before deciding which one to apply or drop. Shows indices, branch names, and
# commit messages for all stashes.

alias git.ss="git stash show"
# Quick way to preview what's in your most recent stash. Shows a file-by-file
# summary of changes without applying them. Use before applying to make sure
# you're restoring the right changes.

alias git.sd="git stash drop"
# Quick way to delete the most recent stash. Use after successfully applying a stash
# with git.sa when you no longer need it, or to clean up unwanted stashes.

alias git.sc="git stash clear"
# Quick way to delete ALL stashes. EXTREMELY DANGEROUS - only use when absolutely
# certain you want to permanently lose all stashed changes. No undo available.

# Stash with messages - Add descriptive text to your stashes
alias git.stash.msg="git stash push -m"
# Stashes changes with a custom descriptive message. Usage: git.stash.msg "your message here"
# The message appears in git stash list, making it easier to identify what each stash
# contains. Essential for managing multiple stashes or remembering what you were working on.

alias git.stash.message="git stash push --message"
# Long form of the above. Functionally identical but uses the full --message flag.
# Some prefer this for its explicit clarity in scripts or documentation.

alias git.stash.save.msg="git stash save"
# Uses the deprecated save command for messages. Unlike push, all arguments become
# part of the message automatically. Usage: git.stash.save.msg your message without quotes.
# Avoid in new scripts - use git.stash.msg instead.

alias git.sm="git stash push -m"
# Ultra-short version of stash with message. Saves typing when you frequently create
# descriptive stashes. Usage: git.sm "message" - just 5 characters plus your message.

# Include untracked files - Stash files that aren't being tracked by git
alias git.stash.untracked="git stash push --include-untracked"
# Stashes both tracked changes AND untracked files (new files you haven't git-added yet).
# By default, git stash ignores untracked files, but this includes them. Essential when
# you've created new files but haven't committed them and need to switch branches.

alias git.stash.u="git stash push -u"
# Short form of the above. The -u flag includes untracked files in the stash.
# Commonly needed when you're working on new features with new files that aren't
# yet tracked by git.

alias git.stash.all="git stash push --all"
# Stashes EVERYTHING: tracked changes, untracked files, AND ignored files (like those
# in .gitignore). This is the most comprehensive stash possible. Use when you want
# to absolutely clean your working directory, including temporary files.

alias git.stash.a="git stash push -a"
# Short form of --all. Includes tracked, untracked, and ignored files in the stash.
# This is comprehensive but can include build artifacts and other files you might
# not want to restore later. Use carefully.

alias git.su="git stash push -u"
# Very short form for stashing with untracked files. Just 6 characters to stash
# both your changes and new files you've created.

alias git.sa.all="git stash push -a"
# Alternative short form for stashing everything. Mnemonically "stash all" but
# conflicts with git.sa (stash apply), so use git.stash.a instead for clarity.

# Keep index operations - Control what happens to your staged changes
alias git.stash.keep="git stash push --keep-index"
# Stashes your working directory changes but KEEPS staged changes in the index.
# This means files you've "git add"ed remain staged for commit. Useful when you
# want to stash unstaged changes but keep your carefully prepared staging area intact.

alias git.stash.k="git stash push -k"
# Short form of --keep-index. After stashing, your index (staging area) remains
# exactly as it was, while unstaged changes are stashed away. Perfect for testing
# partial commits.

alias git.stash.nokeep="git stash push --no-keep-index"
# Explicitly clears the index when stashing (this is the default behavior anyway).
# Both working directory and staged changes are stashed, leaving you with a completely
# clean state matching the last commit.

alias git.sk="git stash push -k"
# Very short form for stash-keep-index. Quick way to stash working changes while
# preserving your staged changes for committing.

# Patch mode (interactive) - Choose exactly which changes to stash
alias git.stash.patch="git stash push --patch"
# Enters interactive mode where git shows you each change (hunk) and asks if you
# want to stash it. You can select 'y' (yes), 'n' (no), 's' (split), etc. This
# gives you fine-grained control over exactly what gets stashed, perfect for
# stashing only part of your work.

alias git.stash.p="git stash push -p"
# Short form of patch mode. Essential when you've made multiple unrelated changes
# but only want to stash some of them. The interactive interface lets you review
# each change individually and decide what to stash.

alias git.sp.patch="git stash push -p"
# Alternative short form for patch mode. Same functionality as git.stash.p.

# Staged changes only - Stash only what you've prepared for commit
alias git.stash.staged="git stash push --staged"
# Stashes ONLY the changes that are currently staged (git add'ed) for commit.
# Working directory changes that aren't staged remain untouched. Useful when you've
# prepared a commit but need to quickly work on something else before committing.

alias git.stash.S="git stash push -S"
# Short form for stashing staged changes only. The capital S distinguishes this
# from other flags. Your unstaged working directory changes remain exactly as they were.

alias git.ss.staged="git stash push -S"
# Alternative for staged-only stashing. Note this conflicts with git.ss (stash show),
# so use git.stash.S for clarity.

# Quiet operations - Suppress informational output
alias git.stash.quiet="git stash push --quiet"
# Stashes changes without showing the usual "Saved working directory and index state"
# message. Useful in scripts or when you don't want stash operations cluttering your
# terminal output. The stash still works normally, just silently.

alias git.stash.q="git stash push -q"
# Short form of quiet stash. Same functionality, less typing.

alias git.sq="git stash push -q"
# Very short quiet stash. Just 6 characters for a silent stash operation.

alias git.stash.pop.quiet="git stash pop -q"
# Pops (applies and removes) the most recent stash without showing success messages.
# The operation works normally but doesn't announce what it's doing. Good for scripts.

alias git.stash.apply.quiet="git stash apply -q"
# Applies the most recent stash silently. The changes are restored but no confirmation
# message is shown. Useful when you want clean terminal output.

alias git.stash.drop.quiet="git stash drop -q"
# Drops (deletes) the most recent stash without confirmation messages. The stash is
# still permanently deleted, but no "Dropped stash@{0}" message appears.

# Specific stash references - Work with particular stashes by index
alias git.stash.0="git stash show stash@{0}"
# Shows the contents of the most recent stash (index 0). This is usually the same
# as "git stash show" but makes it explicit that you want the latest stash.
# Useful when you want to be absolutely clear about which stash you're examining.

alias git.stash.1="git stash show stash@{1}"
# Shows the contents of the second most recent stash. Essential when you have multiple
# stashes and need to examine older ones before deciding which to apply. Each number
# represents how many stashes ago it was created.

alias git.stash.2="git stash show stash@{2}"
# Shows the third most recent stash. The higher the number, the older the stash.
# Use git.sl first to see all available stashes and their indices.

alias git.stash.3="git stash show stash@{3}"
# Shows the fourth most recent stash. Helpful when you've accumulated several stashes
# and need to dig through them to find specific changes.

alias git.stash.4="git stash show stash@{4}"
# Shows the fifth most recent stash. If you have this many stashes, consider cleaning
# up old ones you no longer need with git.stash.drop.

alias git.stash.latest="git stash show stash@{0}"
# Explicitly shows the most recent stash. Identical to git.stash.0 but more descriptive.
# Use when you want your command to be self-documenting about showing the latest stash.

alias git.stash.recent="git stash show stash@{1}"
# Shows the second most recent stash. Identical to git.stash.1 but more descriptive.
# Good for when you want to check the stash you made before the current one.

# Apply/pop specific stashes - Restore particular stashes by index
alias git.stash.pop.0="git stash pop stash@{0}"
# Pops (applies and removes) the most recent stash. This is the same as "git stash pop"
# but explicitly specifies stash@{0}. Use when you want to be absolutely clear about
# which stash you're popping, especially in scripts.

alias git.stash.pop.1="git stash pop stash@{1}"
# Pops the second most recent stash. After this operation, what was stash@{2} becomes
# stash@{1}, etc. The indices shift down when a stash is removed. Useful when you
# want to restore an older stash while keeping the most recent one.

alias git.stash.pop.2="git stash pop stash@{2}"
# Pops the third most recent stash. Remember that after popping, all higher-numbered
# stashes move down in index. Use git.sl to see current stash indices before popping.

alias git.stash.apply.0="git stash apply stash@{0}"
# Applies the most recent stash but keeps it in the stash list. Identical to
# "git stash apply" but explicitly specifies the stash. Good for clarity in scripts
# or when you want to be explicit about which stash you're applying.

alias git.stash.apply.1="git stash apply stash@{1}"
# Applies the second most recent stash while keeping it in the list. Unlike pop,
# apply doesn't change stash indices, so you can apply the same stash multiple times
# or apply it to different branches for testing.

alias git.stash.apply.2="git stash apply stash@{2}"
# Applies the third most recent stash without removing it from the stash list.
# Perfect for testing whether an older stash still applies cleanly to your current
# branch without losing the stash.

alias git.stash.drop.0="git stash drop stash@{0}"
# Drops (permanently deletes) the most recent stash. This is the same as "git stash drop"
# but explicitly specifies which stash. Use after successfully applying a stash when
# you no longer need it, or to clean up unwanted stashes.

alias git.stash.drop.1="git stash drop stash@{1}"
# Drops the second most recent stash. After dropping, all higher-numbered stashes
# move down in index (stash@{2} becomes stash@{1}, etc.). Use to clean up specific
# old stashes you no longer need.

alias git.stash.drop.2="git stash drop stash@{2}"
# Drops the third most recent stash. Be careful - dropped stashes are very difficult
# to recover. Make sure you don't need this stash before dropping it.

# Show with different formats - View stashes in various ways
alias git.stash.show.patch="git stash show -p"
# Shows the most recent stash as a full patch (diff) instead of just a summary.
# This displays exactly what changes are in the stash, line by line, just like
# "git diff". Essential for understanding exactly what will be restored before applying.

alias git.stash.show.p="git stash show -p"
# Short form of patch view. Shows complete line-by-line differences in the stash.
# Much more detailed than the default summary - shows actual code changes.

alias git.stash.show.stat="git stash show --stat"
# Shows the stash as a diffstat - a summary of which files changed and how many lines
# were added/removed in each. More detailed than the default but less overwhelming
# than full patch view. Good overview of the scope of changes.

alias git.stash.show.untracked="git stash show --include-untracked"
# Shows the stash including any untracked files that were stashed. By default,
# "git stash show" only shows tracked files, but this reveals untracked files too.
# Only works if the stash was created with -u or -a flags.

alias git.stash.show.only.untracked="git stash show --only-untracked"
# Shows ONLY the untracked files in the stash, hiding tracked file changes.
# Useful when you want to see what new files you created before stashing.
# Only meaningful for stashes created with -u or -a flags.

alias git.stash.diff="git stash show -p"
# Alternative name for patch view. Shows the complete diff of changes in the stash.
# Some people prefer "diff" terminology over "patch" - functionally identical.

# Combined operations - Multiple flags working together
alias git.stash.keep.untracked="git stash push -k -u"
# Stashes untracked files AND working directory changes, but keeps staged changes
# in the index. This combination is perfect when you've staged some changes for commit,
# created new files, and want to stash everything except your prepared commit.

alias git.stash.keep.all="git stash push -k -a"
# Stashes absolutely everything (tracked, untracked, ignored) but preserves your
# staged changes. The most comprehensive stash while maintaining your staging area.
# Use when you need a completely clean directory but don't want to lose your commit preparation.

alias git.stash.quiet.untracked="git stash push -q -u"
# Silently stashes both tracked changes and untracked files. No output messages,
# but includes new files you've created. Good for scripts that need to stash
# comprehensively without cluttering output.

alias git.stash.patch.keep="git stash push -p -k"
# Interactive stashing that preserves staged changes. You'll be prompted to choose
# which unstaged changes to stash, while everything in your index stays staged.
# Perfect for fine-grained control while preserving commit preparation.

alias git.stash.msg.untracked="git stash push -m"
# Creates a stash with a custom message. Note: This alias is incomplete - it should
# include the -u flag to actually include untracked files. Use git.stash.push -m "message" -u instead.

alias git.stash.staged.quiet="git stash push -S -q"
# Silently stashes only staged changes. Your working directory remains untouched,
# staged changes are stashed, and no output messages appear. Useful in automated
# workflows where you need to temporarily clear the staging area.

# Pop/apply with index - Restore both working tree and staging area
alias git.stash.pop.index="git stash pop --index"
# Pops a stash and attempts to restore both the working directory AND the staging area
# to their original states. Without --index, everything gets restored to the working
# directory as unstaged changes. Can fail if there are conflicts in the index.

alias git.stash.apply.index="git stash apply --index"
# Applies a stash and attempts to restore both working directory and staging area states,
# but keeps the stash in the list. This recreates the exact state when the stash was
# created, including which changes were staged. May fail with index conflicts.

alias git.stash.pop.idx="git stash pop --index"
# Short form of pop with index restoration. Tries to restore the complete state
# including what was staged when the stash was created.

alias git.stash.apply.idx="git stash apply --index"
# Short form of apply with index restoration. Safer than pop because the stash
# remains available if the index restoration fails.

# Advanced aliases - Specialized stash operations
alias git.stash.create="git stash create"
# Creates a stash object (commit) but doesn't store it in the normal stash ref.
# Returns the SHA-1 of the created stash object. This is mainly for scripting -
# you can create a stash, do something else, then store it later with git.stash.store.

alias git.stash.store="git stash store"
# Stores a stash object (created with git stash create) in the stash ref and updates
# the reflog. This is the second half of manual stash creation. Most users never
# need this - it's primarily for advanced scripting scenarios.

alias git.stash.wip="git stash push -m 'WIP'"
# Quick stash with "Work In Progress" message. Perfect for when you're in the middle
# of something and need to switch contexts quickly. The WIP message makes it clear
# this is temporary work that's not ready for commit.

alias git.stash.temp="git stash push -m 'temp'"
# Quick stash with "temp" message. Use for temporary changes you might not even
# want to keep. The short message indicates this is likely throwaway work.

alias git.stash.backup="git stash push -m 'backup'"
# Quick stash with "backup" message. Use when you want to save your current state
# before trying something risky or experimental. The message indicates you might
# want to restore this exact state later.

alias git.stash.save.wip="git stash save 'WIP'"
# Uses the deprecated save command to create a WIP stash. Avoid this in favor of
# git.stash.wip which uses the modern push command.

# List with formatting - View stashes in different formats
alias git.stash.list.oneline="git stash list --oneline"
# Lists all stashes in compact one-line format, showing just the essential info:
# stash index, branch name, and short commit message. Easier to scan when you
# have many stashes. Less detailed but more readable for quick reference.

alias git.stash.list.graph="git stash list --graph"
# Lists stashes with ASCII art showing the relationship between stashes and commits.
# The graph visualization helps understand how stashes relate to your commit history,
# especially useful for understanding when each stash was created relative to branches.

alias git.stash.list.stat="git stash list --stat"
# Lists stashes with file statistics showing which files were changed in each stash
# and how many lines were added/removed. More detailed than default list but less
# overwhelming than patch format. Good overview of stash contents.

alias git.stash.list.patch="git stash list -p"
# Lists all stashes with full patch content - shows the actual line-by-line changes
# in each stash. Very detailed but can be overwhelming with many stashes. Use when
# you need to see exactly what's in each stash without applying them.

# Recovery helpers - Find dropped or cleared stashes
alias git.stash.recover="git fsck --unreachable | grep commit | cut -d\\  -f3 | xargs git log --merges --no-walk --grep=WIP"
# Advanced recovery command that searches for dropped/cleared stashes by finding
# unreachable commits that look like stashes (merge commits with "WIP" in the message).
# This is forensic git - it might find old stashes you thought were gone forever.
# Results need manual inspection to identify actual stashes.

alias git.stash.find.lost="git fsck --unreachable | grep commit | cut -d\\  -f3 | xargs git log --merges --no-walk --grep=WIP"
# Alternative name for stash recovery. Same functionality as git.stash.recover.
# Searches git's object database for stash-like commits that are no longer referenced.
# This is your last resort when you accidentally drop or clear important stashes.

# Workflow aliases - Common multi-command sequences
alias git.stash.pull="git stash && git pull && git stash pop"
# Complete workflow: stash current changes, pull latest updates from remote, then
# restore your changes. Handles the common case where "git pull" fails because you
# have uncommitted changes. If the pop fails due to conflicts, the stash remains
# for manual resolution.

alias git.stash.merge="git stash && git merge"
# Stashes your changes then runs git merge with whatever arguments you provide.
# Usage: git.stash.merge branch-name. Useful when you need to merge but have
# uncommitted changes. Remember to pop your stash after resolving any merge conflicts.

alias git.stash.rebase="git stash && git rebase"
# Stashes changes then runs git rebase. Usage: git.stash.rebase branch-name.
# Essential for rebasing when you have uncommitted work. The stash preserves your
# changes while the rebase rewrites history, then you can pop to restore your work.

alias git.stash.switch="git stash && git switch"
# Stashes changes then switches branches. Usage: git.stash.switch branch-name.
# Perfect when you need to quickly switch branches but have uncommitted changes
# that would prevent the switch. Remember to pop your stash on the new branch if needed.

alias git.stash.checkout="git stash && git checkout"
# Stashes changes then runs git checkout. Usage: git.stash.checkout branch-or-commit.
# Similar to switch but uses the older checkout command. Useful for checking out
# specific commits or when working with older git versions.

# Emergency workflows - Save work when things go wrong
alias git.emergency.stash="git stash push -u -m 'emergency stash'"
# Emergency stash that includes untracked files and has a clear descriptive message.
# Use when something goes wrong and you need to quickly save ALL your work including
# new files. The message makes it clear this was an emergency save for later investigation.

alias git.quick.stash="git stash push -m 'quick save'"
# Fast stash with descriptive message for urgent context switches. Use when you're
# interrupted and need to quickly save your work to handle something else. The message
# indicates this was a hurried save that you'll want to restore soon.

alias git.save.all="git stash push -a -m 'save everything'"
# Most comprehensive emergency stash - saves tracked changes, untracked files, AND
# ignored files (like build artifacts). Use when you're not sure what you need to
# preserve and want to save absolutely everything. Can include large build files.

alias git.panic.stash="git stash push -a -m 'panic save'"
# Ultimate emergency stash with a message indicating you were panicking. Saves
# absolutely everything including ignored files. Use when you're about to do something
# potentially destructive and want to preserve every possible bit of work.

# Development workflows - Stashes for common development patterns
alias git.stash.test="git stash push -k -m 'testing changes'"
# Stashes unstaged changes while keeping staged changes for testing. Perfect when
# you've staged a specific set of changes you want to test in isolation. The staged
# changes remain ready for commit while other work is safely stashed.

alias git.stash.experiment="git stash push -m 'experiment'"
# Stashes experimental changes with a descriptive message. Use when you've been
# trying different approaches and want to save one experiment before trying another.
# The message helps you remember this was exploratory work.

alias git.stash.feature="git stash push -m 'feature work'"
# Stashes feature development work with a clear message. Use when you're working on
# a feature but need to switch to something else temporarily. The message indicates
# this is substantial feature work worth preserving.

alias git.stash.bugfix="git stash push -m 'bugfix'"
# Stashes bug fix changes with descriptive message. Use when you're in the middle
# of fixing a bug but need to handle something else first. Makes it easy to identify
# and return to your debugging work.

alias git.stash.refactor="git stash push -m 'refactoring'"
# Stashes refactoring work with clear message. Use when you're improving code structure
# but need to pause for other work. The message helps distinguish this from feature
# work or bug fixes when you return to it later.
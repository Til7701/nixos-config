# tilman.zsh-theme
# based on af-magic.zsh-theme

function default_color() {
    echo "${FG[007]}"
}

function accent_color() {
    echo "${FG[005]}"
}

function error_code() {
    echo "%(?.. %F{009}%?)"
}

function git_prompt() {
    if [ -d .git ] || git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
        echo " git$(accent_color): $(git_commits_ahead)$(git_commits_behind)$(default_color)$(git_repo_name) $(accent_color)᚜ $(git_prompt_remote)$(git_current_branch) $(default_color)($(git_prompt_status)$(default_color)) $(git_prompt_short_sha)"
    fi
}

# primary prompt$(accent_color) ᚜
PS1="$(default_color)%n$(accent_color)@$(default_color)%M\$(error_code)$(default_color)\$(git_prompt)
$(default_color)%~$(accent_color)%(!.#.»)%{$reset_color%} "
PS2="%{$fg[red]%}\ %{$reset_color%}"

# git settings
ZSH_THEME_GIT_COMMITS_AHEAD_PREFIX="${FG[010]}"
ZSH_THEME_GIT_COMMITS_AHEAD_SUFFIX="↑ "
ZSH_THEME_GIT_COMMITS_BEHIND_PREFIX="${FG[012]}"
ZSH_THEME_GIT_COMMITS_BEHIND_SUFFIX="↓ "
ZSH_THEME_GIT_PROMPT_CLEAN="${FG[010]}clean"
ZSH_THEME_GIT_PROMPT_DIRTY="${FG[011]}dirty"
ZSH_THEME_GIT_PROMPT_DELETED="deleted"
ZSH_THEME_GIT_PROMPT_DIVERGED="${FG[009]}diverged"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="${FG[009]}diverged remote"
ZSH_THEME_GIT_PROMPT_EQUAL_REMOTE="equal remote"
ZSH_THEME_GIT_PROMPT_MODIFIED="${FG[011]}modified"
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_REMOTE_EXISTS="${FG[010]}"
ZSH_THEME_GIT_PROMPT_REMOTE_MISSING="${FG[009]}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER=""
ZSH_THEME_GIT_PROMPT_SHA_BEFORE="$(accent_color)#$(default_color)"
ZSH_THEME_GIT_PROMPT_SUFFIX=""

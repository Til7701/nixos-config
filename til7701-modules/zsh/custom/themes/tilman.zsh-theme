# tilman.zsh-theme
# based on af-magic.zsh-theme

gitPrompt="git${FG[005]}:${FG[007]} \$(git_commits_ahead)\$(git_commits_behind)${FG[007]}\$(git_repo_name)\$(git_prompt_info)\$(git_prompt_short_sha)"

# primary prompt
PS1="${FG[007]}%n${FG[005]}@${FG[007]}%M %(?..%F{009}%? )${FG[007]}%{$gitPrompt%}
${FG[007]}%~${FG[005]}%(!.#.»)%{$reset_color%} "
PS2="%{$fg[red]%}\ %{$reset_color%}"

# git settings
ZSH_THEME_GIT_COMMITS_AHEAD_PREFIX="${FG[010]}"
ZSH_THEME_GIT_COMMITS_AHEAD_SUFFIX="↑ "
ZSH_THEME_GIT_COMMITS_BEHIND_PREFIX="${FG[012]}"
ZSH_THEME_GIT_COMMITS_BEHIND_SUFFIX="↓ "
ZSH_THEME_GIT_PROMPT_CLEAN=" ${FG[007]}(${FG[010]}✔${FG[007]})"
ZSH_THEME_GIT_PROMPT_DIRTY=" ${FG[007]}(${FG[011]}*${FG[007]})"
ZSH_THEME_GIT_PROMPT_PREFIX="${FG[005]} ᚜ $(git_prompt_remote)"
ZSH_THEME_GIT_PROMPT_REMOTE_EXISTS="${FG[010]}"
ZSH_THEME_GIT_PROMPT_REMOTE_MISSING="${FG[009]}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER=""
ZSH_THEME_GIT_PROMPT_SHA_BEFORE=" #"
ZSH_THEME_GIT_PROMPT_SUFFIX=""

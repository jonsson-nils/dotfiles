# Nushell Environment Config File

# bash env compat

load-env (bash -c '
if [ -e /home/jonsson-nils/.nix-profile/etc/profile.d/nix.sh ]; then . /home/jonsson-nils/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
. $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
printenv
' |
 split row "\n" |
 each { split row '=' } |
 each { |it| { $"($it.0)": $"($it.1)" } } |
 reduce { |it,acc| $acc | merge $it } |
 rename -c [PWD pwd]
)

def create_left_prompt [] {
    let path_segment = if (is-admin) {
        $"(ansi red_bold)($env.PWD)"
    } else {
        $"(ansi green_bold)($env.PWD)"
    }

    $path_segment
}

def create_right_prompt [] {
    let time_segment = ([
        (date now | date format '%m/%d/%Y %r')
    ] | str join)

    $time_segment
}

# Use nushell functions to define your right and left prompt
let-env PROMPT_COMMAND = { create_left_prompt }
let-env PROMPT_COMMAND_RIGHT = { create_right_prompt }

# The prompt indicators are environmental variables that represent
# the state of the prompt
let-env PROMPT_INDICATOR = { "〉" }
let-env PROMPT_INDICATOR_VI_INSERT = { ": " }
let-env PROMPT_INDICATOR_VI_NORMAL = { "〉" }
let-env PROMPT_MULTILINE_INDICATOR = { "::: " }

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
let-env ENV_CONVERSIONS = {
  "PATH": {
    from_string: { |s| $s | split row (char esep) | path expand -n }
    to_string: { |v| $v | path expand -n | str join (char esep) }
  }
  "Path": {
    from_string: { |s| $s | split row (char esep) | path expand -n }
    to_string: { |v| $v | path expand -n | str join (char esep) }
  }
}

# Directories to search for scripts when calling source or use
#
# By default, <nushell-config-dir>/scripts is added
let-env NU_LIB_DIRS = [
    ($nu.config-path | path dirname | path join 'scripts')
]

# Directories to search for plugin binaries when calling register
#
# By default, <nushell-config-dir>/plugins is added
let-env NU_PLUGIN_DIRS = [
    ($nu.config-path | path dirname | path join 'plugins')
]

# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
# let-env PATH = ($env.PATH | split row (char esep) | prepend '/some/path')

# let-env PATH = ($env.PATH | append ~/.cargo/bin)

load-env {
  SHELL:  (which nu | get 0 | get path)
  EDITOR: (which nvim | get 0 | get path)
  VISUAL: (which nvim | get 0 | get path)
}

mkdir ~/.cache/starship
mkdir ~/.config
starship init nu | save -f ~/.cache/starship/init.nu
starship preset nerd-font-symbols | save -f ~/.config/starship.toml

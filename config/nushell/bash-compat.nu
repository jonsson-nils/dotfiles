let envToStrip = [
  "PWD"
  "FILE_PWD"
  "CURRENT_FILE"
]

let environmentFromBash = (
bash -c $"
. ($env.HOME)/.nix-profile/etc/profile.d/nix.sh
. ($env.HOME)/.nix-profile/etc/profile.d/hm-session-vars.sh
printenv
"
| split row "\n" 
| each { split row '=' } 
| where { |it| $envToStrip | all { |toStrip| $toStrip != $it.0 } }
| each { |it| { $"($it.0)": $"($it.1)" } } 
| reduce { |it,acc| $acc | merge $it } 
)

load-env $environmentFromBash

load-env { 
  WIN_PATH: (
    $env.PATH
    | split row ":"
    | where {|it| $it =~ '/mnt/c'}
    | uniq
  )
  PATH: (
    $env.PATH
    | split row ":"
    | where {|it| not ($it =~ '/mnt/c')}
    | uniq
  )
}


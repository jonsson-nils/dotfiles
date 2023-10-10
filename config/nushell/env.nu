# Nushell Environment Config File

source '/home/jonsson-nils/.config/nushell/bash-compat.nu'

load-env {
  # Specifies how environment variables are:
  # - converted from a string to a value on Nushell startup (from_string)
  # - converted from a value back to a string when running external commands (to_string)
  # Note: The conversions happen *after* config.nu is loaded
  ENV_CONVERSIONS: {
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
  NU_LIB_DIRS: [
      ($nu.config-path | path dirname | path join 'scripts')
  ]
  # Directories to search for plugin binaries when calling register
  #
  # By default, <nushell-config-dir>/plugins is added
  NU_PLUGIN_DIRS: [
      ($nu.config-path | path dirname | path join 'plugins')
  ]
  ANDROID_SDK_ROOT: $"($env.HOME)/android-sdk"
}
load-env {
  ANDROID_HOME: $env.ANDROID_SDK_ROOT
  NDK_HOME: $"($env.ANDROID_SDK_ROOT)/ndk/26.0.10792818"
  PNPM_HOME: $"($env.HOME)/.local/share/pnpm"
}
load-env {
  PATH: (
    $env.PATH
    | append $"($env.HOME)/.cargo/bin"
    | append $"($env.HOME)/.local/bin"
    | append $"($env.HOME)/.local/share/pnpm"
    | append $"($env.HOME)/.other/t-smart-tmux-session-manager/bin"
    | append $"($env.ANDROID_SDK_ROOT)/cmdline-tools/bin"
    | append $"($env.ANDROID_SDK_ROOT)/platform-tools"
  )
}
load-env {
  SHELL:  (which nu | get 0 | get path)
  EDITOR: (which nvim | get 0 | get path)
  VISUAL: (which nvim | get 0 | get path)
  RUSTC_WRAPPER: (which sccache | get 0 | get path)
}


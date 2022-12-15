if which gcloud > /dev/null; then
  dir=`gcloud info --format="value(installation.sdk_root)"`
  source "$dir/path.zsh.inc"
  source "$dir/completion.zsh.inc"
fi

if which k3d > /dev/null; then
  source <(k3d completion zsh)
fi

if which kubectl > /dev/null; then
  source <(kubectl completion zsh)
fi

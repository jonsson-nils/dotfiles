if which gcloud > /dev/null; then
  dir=`gcloud info --format="value(installation.sdk_root)"`
  source "$dir/path.zsh.inc"
  source "$dir/completion.zsh.inc"
fi

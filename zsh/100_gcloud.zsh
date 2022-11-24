if which gcloud > /dev/null; then
  dir="$(dirname `which gcloud`)"/..
  source "$dir/path.zsh.inc"
  source "$dir/completion.zsh.inc"
fi

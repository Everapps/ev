if [[ ! -o interactive ]]; then
    return
fi

compctl -K _ev ev

_ev() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(ev commands)"
  else
    completions="$(ev completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}

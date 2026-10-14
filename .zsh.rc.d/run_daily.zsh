# Load modules so the script behaves the same on all platforms
zmodload zsh/datetime zsh/stat

run_daily() {
  if (( $# < 2 )); then
    print -u2 "usage: $0 <marker_file> <command> [args...]"
    return 2
  fi

  local marker_file=$1
  shift

  if [[ -e $marker_file ]]; then
    local mtime today
    mtime=$(zstat -F '%Y-%m-%d' +mtime -- "$marker_file") || return 1
    today=$(strftime '%Y-%m-%d' $EPOCHSECONDS)
    [[ $mtime == $today ]] && return 0
  fi

  "$@" && touch -- "$marker_file"
} 

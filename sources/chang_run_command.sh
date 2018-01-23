chang_run_command() {
  command=($(chang_find_command "$@"))
  if [[ $CHANG_DEBUG == true ]]; then
    set -x
  fi
  bash $CHANG_SET $command "${command[@]:1}" || chang_command_error $? "$@"
}
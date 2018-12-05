chang_reset() {
  $CHANG_SYNC_ENABLED && chang-sync stop

  export CHANG_REV_PROXY_ENABLED=false
  export CHANG_SYNC_ENABLED=false

  chang_notice "Resetting chang"
  chang_notice "Current chang revision: $(chang_revision)"
  chang_notice "Clearing current project's state"
  rm -rf $CHANG_STATE_PATH
  chang_notice "Removing all containers"
  chang_compose down --volumes --remove-orphans --timeout 3
  chang_notice "Removing all volumes"

  (
    source $CHANG_TMP_PATH/environment
    while read l; do
      eval echo "$l"
    done < $CHANG_TMP_PATH/volumes | while read volume; do docker volume rm -f $volume; done
  )

  chang_notice "Reset complete"
  chang_notice "Run \`chang start\` to start the app"
}
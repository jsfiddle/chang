chang_rev_proxy_reload() {
  chang_notice "REV PROXY RELOAD!"
  docker exec $CHANG_REV_PROXY_CONTAINER nginx -s reload 2>/dev/null
}
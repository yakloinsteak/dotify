function kill9 () {
  kill $1
  sleep 1
  kill -9 $1
}

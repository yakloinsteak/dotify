ifconfig | grep inet | grep -v '::' | grep -v '127.0' | awk '{print $2}'

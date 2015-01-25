ifconfig | grep -v '127.0.0.1' | grep 'inet addr:' | awk '{print $2}' | cut -d: -f 2 | xargs echo -n

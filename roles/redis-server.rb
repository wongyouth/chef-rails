name "redis-server"
description "Redis Server"

default_attributes({
  'redisio' => {
    'mirror' => 'http://download.redis.io/releases',
    'version' => '2.8.2',
    'servers' => [
      {'name' => 'master', 'port' => '6379', 'unixsocket' => '/tmp/redis.sock', 'unixsocketperm' => '755'},
    ]
  }
})

run_list *%w[
  recipe[redisio::install]
  recipe[redisio::enable]
]

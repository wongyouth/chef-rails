name "memcached"
description "Memcached Server"

default_attributes(
  "memcached" => {
    "memory" => '100', # 100MB
    "listen" => '127.0.0.1'
  }
)

run_list *%w[
  recipe[memcached]
]



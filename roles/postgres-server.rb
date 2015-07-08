name "postgres-server"
description "Postgresql Server"

default_attributes({
  "postgresql" => {
    "password" =>  {
      # `echo -n 'iloverandompasswordsbutthiswilldo''postgres' | openssl md5 | sed -e 's/^/md5/'`
      "postgres" => "md53175bce1d3201d16594cebf9d7eb3f9d", # postgres
      "app" => "md5c256467251d9f08d943740c71ef709bb" # app
    },
    "config" => {
      "listen_addresses" => "0.0.0.0"
    },
    "version" => "9.4",
    "pg_hba" => [
      { type: "local", db: "all", user: "postgres", addr: nil, method: "ident" },
      { type: "local", db: "all", user: "all", addr: nil, method: "ident" },
      { type: "host", db: "all", user: "all", addr: "127.0.0.1/32", method: "md5" },
      { type: "host", db: "all", user: "all", addr: "::1/128", method: "md5" },
    ]
  }
})

run_list *%w[
  recipe[postgresql::server]
]

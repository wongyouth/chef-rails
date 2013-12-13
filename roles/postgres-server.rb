name "postgres-server"
description "Postgresql Server"

default_attributes({
  "postgresql" => {
    "password" =>  {
      # `echo -n 'iloverandompasswordsbutthiswilldo''postgres' | openssl md5 | sed -e 's/^/md5/'`
      "postgres" => "md53175bce1d3201d16594cebf9d7eb3f9d",
      "app" => "md5c256467251d9f08d943740c71ef709bb"
    }
  }
})

run_list *%w[
  recipe[postgresql::server]
]

name "postgres-server"
description "Postgresql Server"

default_attributes({
  "postgresql" => {
    "password" =>  {
      "postgres" => "md53175bce1d3201d16594cebf9d7eb3f9d"
    }
  }
})

run_list *%w[
  recipe[postgresql::server]
]

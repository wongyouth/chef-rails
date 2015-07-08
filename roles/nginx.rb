name "nginx"
description "Nginx Server"

default_attributes()

run_list *%w[
  recipe[nginx]
]


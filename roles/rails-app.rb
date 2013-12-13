name "rails-app"
description "Rails app Server"

default_attributes({
  #"rbenv" => {
  #  "group_users" => ["deploy"]
  #},
})

run_list *%w[
  recipe[nodejs]
  recipe[my_app]
]

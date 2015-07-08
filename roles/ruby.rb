name "ruby"
description "ruby Server"

default_attributes({
  "rbenv" => {
    "git_repository" => "http://github.com/sstephenson/rbenv.git",
    # "group_users" => ["deploy"]
  },
  "ruby_build" => {
    "git_repository" => "http://github.com/sstephenson/ruby-build.git",
  },
  "rbenv_vars" => {
    "git_repository" => "http://github.com/sstephenson/rbenv_vars.git",
  },
})

run_list *%w[
  recipe[nodejs]
  recipe[my_app::ruby]
]


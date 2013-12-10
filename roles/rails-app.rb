name "rails-app"
description "Rails app Server"

default_attributes({
  #"rbenv" => {
  #  "group_users" => ["deploy"]
  #},
  "rbenv_install_rubies" => {
    "global_version" => "2.0.0-p353",
    #"other_versions" => ["1.9.3-p484"],
    "gems" => ["bundler", "pry"],
    "lib_packages" => ["libc6-dev", "libtool", "libyaml-dev", "zlib1g-dev", "libssl-dev", "libreadline-dev", "libxml2-dev", "libxslt1-dev", "ncurses-dev", "libmagickwand-dev"]
  }
})

run_list *%w[
  recipe[rbenv-install-rubies]
]

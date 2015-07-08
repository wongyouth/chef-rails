name "server"
description "Server"

default_attributes(
  "authorization" => {
    "sudo" => {
      "groups" => ["sudo", "admin"],
      "passwordless" => true
    }
  }
)

run_list *%w[
  recipe[build-essential]
  recipe[sudo]
  recipe[chef-solo-search]
  recipe[git]
  recipe[openssl]
  recipe[ntp]
  recipe[byobu]
]

#  recipe[users::sysadmins]

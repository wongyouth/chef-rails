include_recipe "database::postgresql"

postgresql_database_user 'app' do
  connection(
    host: 'localhost',
    username: 'postgres',
    password: 'postgres'
  )
  password 'app'
  action :create
end

postgresql_database 'my_app' do
  owner 'app'
  action :create
  encoding 'utf8'
  collation 'en_US.utf8'
  template 'template0'
  connection(
    host: 'localhost',
    username: 'postgres',
    password: 'postgres'
  )
end


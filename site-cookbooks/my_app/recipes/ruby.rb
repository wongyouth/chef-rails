include_recipe 'rbenv'
include_recipe 'rbenv::ruby_build'
include_recipe "runit"
include_recipe "monit"
include_recipe "locales"

locales "zh_CN.utf8"

rbenv_ruby '2.2.2' do
  global true
end

rbenv_gem 'bundler' do
  ruby_version '2.2.2'
end


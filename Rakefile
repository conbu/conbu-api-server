
task :default => 'api-server'

task 'api-server' do
  sh 'bundle exec rackup'
end

task :dummy => 'dummy-api-server'

task 'dummy-api-server' do
  sh 'bundle exec rackup dev-config.ru'
end

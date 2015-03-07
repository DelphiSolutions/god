# Install god
include_recipe 'god::default'

# Create a simple program to watch
ruby_script = <<SCRIPT
loop do
  puts 'God testing . . .'
  puts '. . . cools'
  sleep 1
  $stdout.flush
end

SCRIPT

file '/tmp/simple.rb' do
  content ruby_script
  mode '0640'
end

god_watch 'simple-app' do
  start_command 'ruby /tmp/simple.rb'
  working_directory '/tmp/'

  user 'root'
  group 'root'
  template_sensitive false
end

if node['god']['test']['remove_watch'] # ~FC023
  log 'Sleeping for 45 seconds'
  ruby_block 'ruby-god-test-remove-watch' do
    block do
      sleep(45)
    end
  end

  god_watch 'simple-app' do
    user 'root'
    group 'root'
    template_sensitive false

    action :delete
  end
end

log 'Attempting to delete non-existent god job'
god_watch 'fake-app' do
  user 'nobody'
  group 'nogroup'
  template_sensitive false

  action :delete
end

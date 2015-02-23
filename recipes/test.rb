# Install god
include_recipe 'god::default'

# Create a simple program to watch
ruby_script = <<SCRIPT
loop do
  puts 'God testing . . .'
  sleep 1
end

SCRIPT

file '/tmp/simple.rb' do
  content ruby_script
  mode '0640'
end

god_watch 'simple-app' do
  start_command 'ruby /tmp/simple.rb'
  working_directory '/tmp'

  user 'root'
  group 'root'
  template_sensitive false
end

if node['god']['test']['remove_watch'] # ~FC023
  god_watch 'simple-app' do
    user 'root'
    group 'root'
    template_sensitive false

    action :delete
  end
end

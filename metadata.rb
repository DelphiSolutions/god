name              'god'
maintainer        'Opscode, Inc.'
maintainer_email  'cookbooks@opscode.com'
license           'Apache 2.0'
description       'Installs and configures god and provides a define for monitoring'
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           '1.3.1'

recipe 'god', 'Installs god and starts it as a runit service'

%w{debian ubuntu}.each do |os|
  supports os
end

depends 'runit', '>= 1.1.6'
depends 'upstart', '~> 1.2'

name             'pelias'
maintainer       'Mapzen'
maintainer_email 'grant@mapzen.com'
license          'GPL'
description      'Installs/configures Pelias in a vagrant environment. Intended for education and development.'
version          '0.6.6'


depends 'apt', '~> 2.7.0'
depends 'elasticsearch', '2.4.1'
depends 'java', '~> 1.50.0'
depends 'user'
depends 'runit', '1.5.18'
depends 'nginx', '= 2.1.0'
depends 'nodejs', '2.4.0'
depends 'ohai', '< 4.0.0'

%w(ubuntu).each do |os|
  supports os
end


# Chef 11.x compatibility
# depends "ark", "< 2.0.1"
# depends "homebrew", "< 3.0.0"
# depends "rsyslog", "2.2.0"
# depends "yum", "3.13.0"
# depends "yum-epel", "0.7.1"

name             'web'
maintainer       'Anton Tkachenka'
maintainer_email 'anton_tkachenka@epam.com'
license          'All rights reserved'
description      'Installs/Configures web'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends "web_nginx"
depends "web_apache"

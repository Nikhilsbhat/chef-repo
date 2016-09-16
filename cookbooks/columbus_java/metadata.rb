name              'columbus_java'
description       'Installs/Configures java'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
minor_ver = `git log -n 1 --pretty=format:'%at' #{File.dirname(__FILE__)} 2> /dev/null`
version           '0.2.' + (minor_ver != '' ? minor_ver : '0')

depends		 'java'
depends    'swap'

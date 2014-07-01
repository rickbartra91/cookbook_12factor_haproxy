name             '12factor_haproxy'
maintainer       'Jordan curzon'
maintainer_email 'curzonj@gmail.com'
license          'Apache 2.0'
description      'Installs/Configures haproxy'
version          '0.0.1'

%w(centos debian ubuntu).each do |os|
  supports os
end

%w(haproxy).each do |ckbk|
  depends ckbk
end

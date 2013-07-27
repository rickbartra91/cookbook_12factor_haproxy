default['12factor_haproxy']['port'] = 8080
default['12factor_haproxy']['logging']['host'] = '127.0.0.1'
default['12factor_haproxy']['logging']['port'] = '514'
default['12factor_haproxy']['config_cookbook'] = '12factor_haproxy'
default['12factor_haproxy']['config_template'] = "haproxy-app_lb.cfg.erb"

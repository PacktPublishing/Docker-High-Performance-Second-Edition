name 'base'

default_source :supermarket
cookbook 'dockerhost', path: '../cookbooks/dockerhost'

run_list 'dockerhost::base'
named_run_list 'manager', 'dockerhost::manager'

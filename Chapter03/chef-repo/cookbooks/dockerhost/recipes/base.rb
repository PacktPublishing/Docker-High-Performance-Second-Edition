yum_repository 'docker-stable' do
  description 'Docker CE Stable'
  baseurl 'https://download.docker.com/linux/centos/7/$basearch/stable'
  gpgkey 'https://download.docker.com/linux/centos/gpg'
end

docker_service 'default' do
  # Chapter 3: change for monitoring
  misc_opts '--experimental=true --metrics-addr=0.0.0.0:1337'
  # Chapter 3: change for logging
  log_driver 'gelf'
  log_opts "gelf-address=udp://#{node['ipaddress']}:12201"
  version '18.09.0'
  install_method 'package'
  setup_docker_repo false
  action %w(create start)
end

swarm  = begin
           chef_vault_item('docker', 'swarm')\
             [node.policy_group]
         rescue Net::HTTPServerException
           {}
         end

execute 'join swarm' do
  command 'docker swarm join '\
          "--token #{swarm['token']} #{swarm['manager']}"
  not_if { swarm.empty? }
  not_if 'docker info -f "{{.Swarm.LocalNodeState}}" | egrep "^active"'
end

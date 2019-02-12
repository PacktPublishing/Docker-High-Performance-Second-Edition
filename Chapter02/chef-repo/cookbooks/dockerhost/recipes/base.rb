yum_repository 'docker-stable' do
  description 'Docker CE Stable'
  baseurl 'https://download.docker.com/linux/centos/7/$basearch/stable'
  gpgkey 'https://download.docker.com/linux/centos/gpg'
end

docker_service 'default' do
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

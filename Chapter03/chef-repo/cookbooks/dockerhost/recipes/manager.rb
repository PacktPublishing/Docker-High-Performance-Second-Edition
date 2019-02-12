include_recipe 'dockerhost::base'

execute 'init swarm' do
  command 'docker swarm init'
  not_if 'docker info -f "{{.Swarm.LocalNodeState}}" | egrep "^active"'
end

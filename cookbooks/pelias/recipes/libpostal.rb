#
# Cookbook Name:: pelias
# Recipe:: libpostal
#

include_recipe 'apt::default'

# libpostal prerequisites
package 'curl'
package 'autoconf'
package 'automake'
package 'libtool'
package 'pkg-config'

git node[:pelias][:libpostal][:deploy_to] do
  action      :sync
  user        node[:pelias][:user][:name]
  repository  node[:pelias][:libpostal][:repository]
  revision    node[:pelias][:libpostal][:revision]
end

execute "libpostal build" do
  user node[:pelias][:user][:name]
  cwd node[:pelias][:libpostal][:deploy_to]
  command <<-EOF
    ./bootstrap.sh
    ./configure --datadir=#{node[:pelias][:libpostal][:data_dir]}
    make
    EOF
end

execute "libpostal install" do
  user 'root'
  cwd node[:pelias][:libpostal][:deploy_to]
  command <<-EOF
    make install
    ldconfig
    EOF
end
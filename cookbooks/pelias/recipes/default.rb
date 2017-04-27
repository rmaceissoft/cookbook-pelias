#
# Cookbook Name:: pelias
# Recipe:: default
#

%w(
  setup
  config
  api
  schema
  openaddresses
  geonames
  osm
  gtfs
  nginx
).each do |r|
  include_recipe "pelias::#{r}"
end

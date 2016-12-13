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
  quattroshapes
  osm
  gtfs
  nginx
).each do |r|
  include_recipe "pelias::#{r}"
end

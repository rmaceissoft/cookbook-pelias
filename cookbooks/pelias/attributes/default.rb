include_attribute 'pelias::external'

# env
default[:pelias][:basedir]                              = '/opt/pelias'
default[:pelias][:cfg_dir]                              = '/etc/pelias'
default[:pelias][:cfg_file]                             = 'pelias.json'
default[:pelias][:node_env]                             = 'dev'

# user
default[:pelias][:user][:name]                          = 'pelias'
default[:pelias][:user][:home]                          = '/home/pelias'

# esclient
default[:pelias][:esclient][:logdir]                    = '/var/log/esclient'
default[:pelias][:esclient][:keepalive]                 = true
default[:pelias][:esclient][:request_timeout]           = 120_000
default[:pelias][:esclient][:api_version]               = '1.3'
default[:pelias][:esclient][:max_retries]               = 3
default[:pelias][:esclient][:dead_timeout]              = 3000
default[:pelias][:esclient][:max_sockets]               = 20

# api
default[:pelias][:api][:port]                           = 3100
default[:pelias][:api][:deploy_to]                      = "#{node[:pelias][:basedir]}/pelias-api"
default[:pelias][:api][:repository]                     = 'https://github.com/LACMTA/pelias-api.git'
default[:pelias][:api][:revision]                       = 'production'
default[:pelias][:api][:restart_wait]                   = 60
default[:pelias][:api][:shutdown_timeout]               = 30
default[:pelias][:api][:text_analyzer]                  = "addressit"

# libpostal
default[:pelias][:libpostal][:deploy_to]                = "#{node[:pelias][:basedir]}/libpostal"
default[:pelias][:libpostal][:repository]               = 'https://github.com/openvenues/libpostal.git'
default[:pelias][:libpostal][:revision]                 = 'v1.0.0'
default[:pelias][:libpostal][:data_dir]                 = "#{node[:pelias][:basedir]}/data/libpostal"


# address-deduper
default[:pelias][:address_deduper][:repository]         = 'https://github.com/openvenues/address_deduper'
default[:pelias][:address_deduper][:revision]           = 'master'
default[:pelias][:address_deduper][:leveldb]            = "#{node[:pelias][:basedir]}/leveldb/address_dedup/db"

# openaddresses
default[:pelias][:openaddresses][:repository]           = 'https://github.com/pelias/openaddresses'
default[:pelias][:openaddresses][:revision]             = 'production'
default[:pelias][:openaddresses][:data_files]           = [] # will load all OA
default[:pelias][:openaddresses][:full_data_url]        = 'http://data.openaddresses.io/openaddresses-complete.zip'
default[:pelias][:openaddresses][:data_path]            = 'http://data.openaddresses.io.s3.amazonaws.com'
default[:pelias][:openaddresses][:full_file_name]       = node[:pelias][:openaddresses][:full_data_url].split('/').last
default[:pelias][:openaddresses][:data_dir]             = "#{node[:pelias][:basedir]}/data/openaddresses"
default[:pelias][:openaddresses][:index_data]           = true
default[:pelias][:openaddresses][:timeout]              = 172_800 # 48 hours

# geonames
default[:pelias][:geonames][:repository]                = 'https://github.com/pelias/geonames.git'
default[:pelias][:geonames][:data_dir]                  = "#{node[:pelias][:basedir]}/data/geonames"
default[:pelias][:geonames][:data_url]                  = 'http://download.geonames.org/export/dump'
default[:pelias][:geonames][:revision]                  = 'production'
default[:pelias][:geonames][:index_data]                = false
default[:pelias][:geonames][:country_code]              = 'ALL'
default[:pelias][:geonames][:timeout]                   = 7200 # 2 hours

# quattroshapes
default[:pelias][:quattroshapes][:alpha3_country_codes] = %w(USA)
default[:pelias][:quattroshapes][:data_url]             = 'http://quattroshapes.mapzen.com/quattroshapes'
default[:pelias][:quattroshapes][:checksum]             = 'e89cd4cb232aaea00d14972247ac8229a74378968901af4661b8aa7fada23bcb'
default[:pelias][:quattroshapes][:repository]           = 'https://github.com/pelias/quattroshapes.git'
default[:pelias][:quattroshapes][:revision]             = 'master'
default[:pelias][:quattroshapes][:admin_lookup]         = false
default[:pelias][:quattroshapes][:data_dir]             = "#{node[:pelias][:basedir]}/data/quattroshapes"
default[:pelias][:quattroshapes][:index_data]           = true
default[:pelias][:quattroshapes][:types]                = %w(admin0 admin1 admin2 local_admin locality neighborhood)
default[:pelias][:quattroshapes][:timeout]              = 3600 # 1 hour per type

# whosonfirst
default[:pelias][:whosonfirst][:repository]             = 'https://github.com/pelias/whosonfirst.git'
default[:pelias][:whosonfirst][:revision]               = 'production'
default[:pelias][:whosonfirst][:data_dir]               = "#{node[:pelias][:basedir]}/data/whosonfirst"
default[:pelias][:whosonfirst][:index_data]             = true

# osm
default[:pelias][:osm][:data_dir]                       = "#{node[:pelias][:basedir]}/data/osm"
default[:pelias][:osm][:repository]                     = 'https://github.com/pelias/openstreetmap.git'
default[:pelias][:osm][:revision]                       = 'production'
default[:pelias][:osm][:index_data]                     = false
default[:pelias][:osm][:admin_lookup]                   = false
default[:pelias][:osm][:timeout]                        = 14_400 # 4 hours
default[:pelias][:osm][:leveldb]                        = "#{node[:pelias][:basedir]}/leveldb/osm"
default[:pelias][:osm][:extracts]                       = {}

# gtfs
default[:pelias][:gtfs][:repository]                    = 'https://github.com/rmaceissoft/pelias-gtfs'
default[:pelias][:gtfs][:revision]                      = 'master'
default[:pelias][:gtfs][:stops_url]                     = 'http://<ip_address>/otp/routers/default/index/stops/'
default[:pelias][:gtfs][:index_data]                    = false
default[:pelias][:gtfs][:admin_lookup]                  = true

# schema
default[:pelias][:schema][:repository]                  = 'https://github.com/pelias/schema.git'
default[:pelias][:schema][:revision]                    = 'master'
default[:pelias][:schema][:drop_index]                  = false
default[:pelias][:schema][:create_index]                = false
default[:pelias][:schema][:replicas]                    = 0
default[:pelias][:schema][:shards]                      = 1
default[:pelias][:schema][:concurrency]                 = 24

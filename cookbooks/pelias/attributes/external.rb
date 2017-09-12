# external cookbook overrides
#

# nodejs
default[:nodejs][:version] = '4.2.6'
default[:nodejs][:binary][:checksum][:linux_x64] = '656d8bff06cc5e108b83176f81de7e1eb16392ae0958ec4a7bca2a3a309333a1'

# elasticsearch
default[:elasticsearch][:version]               = '2.4.4'
#default[:elasticsearch][:skip_restart]          = true
#default[:elasticsearch][:bootstrap][:mlockall]  = false
#default[:elasticsearch][:allocated_memory]      = "#{(node[:memory][:total].to_i * 0.6).floor / 1024}m"
#default[:elasticsearch][:plugin][:mandatory]    = %w()
#default[:elasticsearch][:custom_config]         = {
#  'threadpool.bulk.type'      => 'fixed',
#  'threadpool.bulk.size'      => '4',
#  'threadpool.bulk.wait_time' => '10s',
#  'threadpool.bulk.queue'     => '1000',
#  'index.refresh_interval'    => '30s'
#}

# java
default[:java][:ark_retries]                            = 2
default[:java][:ark_retry_delay]                        = 3
default[:java][:ark_timeout]                            = 300
default[:java][:install_flavor]                         = 'oracle'
default[:java][:jdk_version]                            = '8'
default[:java][:oracle][:accept_oracle_download_terms]  = true

# nginx
default[:nginx][:default_site_enabled] = false

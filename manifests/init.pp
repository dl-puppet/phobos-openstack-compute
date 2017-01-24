class compute 
(  
  ######### "PACKAGES" ########
  $package_manage               	= $compute::params::package_manage,
  $package_name                 	= $compute::params::package_name,
  $package_ensure               	= $compute::params::package_ensure,    

  ###### "CONFIG_FILES" ###### 
  $file_ensure                  	= $compute::params::file_ensure,      
  $file_backup                  	= $compute::params::file_backup,           
  $file_group                   	= $compute::params::file_group,        
  $file_mode                    	= $compute::params::file_mode,        
  $file_owner                   	= $compute::params::file_owner,       

  ######### "SERVICES" ########
  $service_name                 	= $compute::params::service_name, 
  $service_ensure               	= $compute::params::service_ensure,            
  $service_enable               	= $compute::params::service_enable,
  $service_hasstatus            	= $compute::params::service_hasstatus,
  $service_hasrestart           	= $compute::params::service_hasrestart,   

  ####### "USER" #######  
  $user                         	= $compute::params::user,
	$user_ensure                  	= $compute::params::user_ensure,
	$user_uid                     	= $compute::params::user_uid,
	$user_managehome              	= $compute::params::user_managehome,
	$user_shell                   	= $compute::params::user_shell,

  #####   "CHRONY"  ######
  $chromy_allow                 	= $compute::params::chromy_allow,
  $chromy_servers               	= $compute::params::chromy_servers,

  
  #####   "NETWORK"  ######
  # Config /etc/sysconfig/network :
  $network_networking           	= $compute::params::network_networking,
  #$HOSTNAME                    	= $compute::params::HOSTNAME,
  $network_nm                   	= $compute::params::network_nm,
  $network_nozeroconf           	= $compute::params::network_nozeroconf,
  $network_gateway              	= $compute::params::network_gateway,

  # /etc/sysconfig/networks:
  $list_networks                	= $compute::params::list_networks,                    
    
  # /etc/resolv.conf:
  $resolv_nameserver            	= $compute::params::resolv_nameserver,
  
  # /etc/sysconfig/network-script/route-eth0:
  $route_eth0                   	= $compute::params::route_eth0,

  # /etc/sysconfig/network-scripts/ifcfg-eth0:
  $ifcfg_device                   = $compute::params::ifcfg_device,  
  $ifcfg_type                   	= $compute::params::ifcfg_type,
  $ifcfg_name                   	= $compute::params::ifcfg_name,
  $ifcfg_hotplug                	= $compute::params::ifcfg_hotplug,
  $ifcfg_onboot                 	= $compute::params::ifcfg_onboot,
  $ifcfg_controlled             	= $compute::params::ifcfg_controlled,
  $ifcfg_ipv6init               	= $compute::params::ifcfg_ipv6init,
  #$HWADDR                      	= "<%= scope.lookupvar('::macaddress_eth0') %>",
  $ifcfg_bootproto              	= $compute::params::ifcfg_bootproto,
  $ifcfg_defroute               	= $compute::params::ifcfg_defroute,
  $resolv_peerdns               	= $compute::params::ifcfg_peerdns,
  $ifcfg_peerntp                	= $compute::params::ifcfg_peerntp,
  $ifcfg_peerroutes             	= $compute::params::ifcfg_peerroutes,
  $ifcfg_ip_failure             	= $compute::params::ifcfg_ip_failure,
  $ifcfg_network                	= $compute::params::ifcfg_network,
  $ifcfg_ipaddr                 	= $compute::params::ifcfg_ipaddr,
  $ifcfg_netmask                	= $compute::params::ifcfg_netmask,
  $ifcfg_gateway                	= $compute::params::ifcfg_gateway,
  $ifcfg_broadcast              	= $compute::params::ifcfg_broadcast,
  $ifcfg_nozeroconf             	= $compute::params::ifcfg_nozeroconf,   
  $ifcfg_ethtool_opts           	= $compute::params::ifcfg_ethtool_opts,
  
  # "/etc/host.conf":
  $host_conf                    	= $compute::params::host_conf,
  # "/etc/hosts":
  $list_host                    	= $compute::params::list_host,
 
   
  #####   NOVA COMPUTE  ######   
  ###[DEFAULT]
  $nova_compute_rpc_backend       = $compute::params::nova_compute_rpc_backend,
  $nova_compute_auth_strategy     = $compute::params::nova_compute_auth_strategy,
  $nova_compute_my_ip             = $compute::params::nova_compute_my_ip,
  $nova_compute_use_neutron       = $compute::params::nova_compute_use_neutron,
  $nova_compute_firewall_driver   = $compute::params::nova_compute_firewall_driver,
  $nova_compute_enabled_apis      = $compute::params::nova_compute_enabled_apis,
  $nova_compute_transport_url     = $compute::params::nova_compute_transport_url,
  ###[oslo_messaging_rabbit]
  $rabbit_host                    = $compute::params::rabbit_host,
  $rabbit_userid                  = $compute::params::rabbit_userid ,
  $rabbit_password                = $compute::params::rabbit_password,
  ###[keystone_authtoken]
	$keystone_auth_uri               = $compute::params::keystone_auth_uri,
	$keystone_auth_url               = $compute::params::keystone_auth_url,
	$keystone_memcached_servers      = $compute::params::keystone_memcached_servers,
	$keystone_auth_type              = $compute::params::keystone_auth_type,
	$keystone_project_domain_name    = $compute::params::keystone_project_domain_name,
	$keystone_user_domain_name       = $compute::params::keystone_user_domain_name,
	$keystone_project_name           = $compute::params::keystone_project_name,
	$keystone_username               = $compute::params::keystone_username,
	$keystone_password               = $compute::params::keystone_password,
	###[vnc]
  $vnc_enabled                     = $compute::params::vnc_enabled,
  $vncserver_listen                = $compute::params::vncserver_listen,
  $vncserver_proxyclient_address   = $compute::params::vncserver_proxyclient_address,
  $novncproxy_base_url             = $compute::params::novncproxy_base_url,
  ###[glance]
  $glance_api_servers              = $compute::params::glance_api_servers,
  ###[oslo_concurrency]
  $oslo_lock_path                  = $compute::params::oslo_lock_path,
  ###[libvirt]
  $libvirt_virt_type               = $compute::params::libvirt_virt_type,
  
  
  ##### NEUTRON COMPUTE ######
  ###/etc/neutron/neutron.conf: 
  ###[DEFAULT]
  $neutron_transport_url           = $compute::params::neutron_transport_url,
  $neutron_auth_strategy           = $compute::params::neutron_auth_strategy,
  ###[keystone_authtoken]
  $neutron_auth_uri                = $compute::params::neutron_auth_uri,
  $neutron_auth_url                = $compute::params::neutron_auth_url,
  $neutron_memcached_servers       = $compute::params::neutron_memcached_servers,
  $neutron_auth_type               = $compute::params::neutron_auth_type,
  $neutron_project_domain_name     = $compute::params::neutron_project_domain_name,
  $neutron_user_domain_name        = $compute::params::neutron_user_domain_name,
  $neutron_project_name            = $compute::params::neutron_project_name,
  $neutron_username                = $compute::params::neutron_username,
  $neutron_password                = $compute::params::neutron_password,
  ###[oslo_concurrency]
  $neutron_lock_path               = $compute::params::neutron_lock_path,

  ###/etc/neutron/plugins/ml2/linuxbridge_agent.ini:       
  ###[linux_bridge]
  $linuxbridge_physical_interface_mappings = $compute::params::linuxbridge_physical_interface_mappings,
  ###[vxlan]
  $linuxbridge_enable_vxlan        = $compute::params::linuxbridge_enable_vxlan,
  $linuxbridge_local_ip            = $compute::params::linuxbridge_local_ip,
  $linuxbridge_l2_population       = $compute::params::linuxbridge_l2_population,
  ###[securitygroup]
  $linuxbridge_enable_security_group= $compute::params::linuxbridge_enable_security_group,
  $linuxbridge_enable_firewall_driver= $compute::params::linuxbridge_enable_firewall_driver,
        
  ###/etc/nova/nova.conf:
  $nova_neutro_url                 = $compute::params::nova_neutro_url,
  $nova_neutro_auth_url            = $compute::params::nova_neutro_auth_url,
  $nova_neutro_auth_type           = $compute::params::nova_neutro_auth_type,
  $nova_neutro_project_domain_name = $compute::params::nova_neutro_project_domain_name,
  $nova_neutro_user_domain_name    = $compute::params::nova_neutro_user_domain_name,
  $nova_neutro_region_name         = $compute::params::nova_neutro_region_name,
  $nova_neutro_project_name        = $compute::params::nova_neutro_project_name,
  $nova_neutro_username            = $compute::params::nova_neutro_username,
  $nova_neutro_password            = $compute::params::nova_neutro_password,
        
) inherits compute::params  
{
  ###### "PACKAGE" ######
  validate_bool                  	($package_manage)
  validate_array                 	($package_name)
  validate_string                	($package_ensure)

  ###### "CONFIG" ######
  validate_string                	($file_ensure)      
  validate_string                	($file_backup)  
  #validate_string               	($file_group)   
  #validate_string               	($file_mode) 
  #validate_string               	($file_owner)   
  
  ###### "SERVICE" ######
  validate_array                 	($service_name)
  validate_string                	($service_ensure)
  validate_bool                  	($service_enable)

  ###### "USER" ######
  validate_string                	($user)
  validate_string                	($user_ensure)
  validate_string                	($user_uid)
  validate_bool                  	($user_managehome)
  validate_string                	($user_shell)

  ###### "CHROMY" ######
  validate_string                	($chromy_allow)
  validate_array                 	($chromy_servers) 
  
  ##### "NETWORK" ######
  # Config /etc/sysconfig/network :
  validate_string                	($network_networking)
  validate_string                	($network_nm)
  validate_string                	($network_nozeroconf)
  validate_string                	($network_gateway)

  # /etc/networks:
  # Config /etc/sysconfig/network :
  validate_array                 	($list_networks)                    
    
  # /etc/resolv.conf:
  # Config /etc/sysconfig/network :
  validate_string                	($resolv_nameserver)
  
  # /etc/sysconfig/network-script/route-eth0:
   # Config /etc/sysconfig/network :
  validate_array                 	($route_eth0)

  # /etc/sysconfig/network-scripts/ifcfg-eth0:
  validate_string                	($ifcfg_device)
  validate_string                	($ifcfg_type)
  validate_string                	($ifcfg_name)
  validate_string                	($ifcfg_hotplug)
  validate_string                	($ifcfg_onboot)
  validate_string                	($ifcfg_controlled)
  validate_string                	($ifcfg_ipv6init)
  validate_string                	($ifcfg_bootproto)
  validate_string                	($ifcfg_peerdns)
  validate_string                	($ifcfg_peerntp)
  validate_string                	($ifcfg_peerroutes)
  validate_string                	($ifcfg_ip_failure)
  validate_string                	($ifcfg_network)
  validate_string                	($ifcfg_ipaddr)
  validate_string                	($ifcfg_netmask)
  validate_string                	($ifcfg_gateway)
  validate_string                	($ifcfg_broadcast)
  validate_string                	($ifcfg_nozeroconf)    
  validate_string                	($ifcfg_ethtool_opts)

  # /etc/host.conf:
  validate_string                	($host_conf)

  # /etc/hosts:
  validate_array                 	($list_host)


  #####   NOVA COMPUTE  ######   
  ###[DEFAULT]
  validate_string                 ($nova_compute_rpc_backend)
  validate_string                 ($nova_compute_auth_strategy)
  validate_string                 ($nova_compute_my_ip)
  validate_bool                   ($nova_compute_use_neutron)
  validate_string                 ($nova_compute_firewall_driver)
  validate_string                 ($nova_compute_enabled_apis) 
  validate_string                 ($nova_compute_transport_url)
  ###[oslo_messaging_rabbit]
  validate_string                 ($rabbit_host)
  validate_string                 ($rabbit_userid)
  validate_string                 ($rabbit_password)
  ###[keystone_authtoken]
  validate_string                 ($keystone_auth_uri)
  validate_string                 ($keystone_auth_url)
  validate_string                 ($keystone_memcached_servers)
  validate_string                 ($keystone_auth_type)
  validate_string                 ($keystone_project_domain_name)
  validate_string                 ($keystone_user_domain_name)
  validate_string                 ($keystone_project_name)
  validate_string                 ($keystone_username)
  validate_string                 ($keystone_password)
  ###[vnc]
  validate_bool                   ($vnc_enabled)
  validate_string                 ($vncserver_listen)
  validate_string                 ($vncserver_proxyclient_address)
  validate_string                 ($novncproxy_base_url)
  ###[glance]
  validate_string                 ($glance_api_servers)
  ###[oslo_concurrency]
  validate_string                 ($oslo_lock_path)
  ###[libvirt]
  validate_string                 ($libvirt_virt_type)
  
  
  ##### NEUTRON COMPUTE ######
  ###/etc/neutron/neutron.conf: 
  ###[DEFAULT]
  validate_string                 ($neutron_transport_url)
  validate_string                 ($neutron_auth_strategy)
  ###[keystone_authtoken]
  validate_string                 ($neutron_auth_uri)
  validate_string                 ($neutron_auth_url)
  validate_string                 ($neutron_memcached_servers)
  validate_string                 ($neutron_auth_type)
  validate_string                 ($neutron_project_domain_name)
  validate_string                 ($neutron_user_domain_name)
  validate_string                 ($neutron_project_name)
  validate_string                 ($neutron_username)
  validate_string                 ($neutron_password)
  ###[oslo_concurrency]
  validate_string                 ($neutron_lock_path) 
  
  ###/etc/neutron/plugins/ml2/linuxbridge_agent.ini:       
  ###[linux_bridge]
  validate_string                 ($linuxbridge_physical_interface_mappings)
  ###[vxlan]
  validate_string                 ($linuxbridge_enable_vxlan)
  validate_string                 ($linuxbridge_local_ip)
  validate_string                 ($linuxbridge_l2_population)
  ###[securitygroup]
  validate_string                 ($linuxbridge_enable_security_group)
  validate_string                 ($linuxbridge_enable_firewall_driver)
        
  ###/etc/nova/nova.conf:
  validate_string                 ($nova_neutro_url)
  validate_string                 ($nova_neutro_auth_url)
  validate_string                 ($nova_neutro_auth_type)
  validate_string                 ($nova_neutro_project_domain_name)
  validate_string                 ($nova_neutro_user_domain_name)
  validate_string                 ($nova_neutro_region_name)
  validate_string                 ($nova_neutro_project_name) 
  validate_string                 ($nova_neutro_username)
  validate_string                 ($nova_neutro_password)
  
  anchor { 'compute::begin': } ->
    class { '::compute::install': } ->
    class { '::compute::config': } ~>
    class { '::compute::service': } ->
    class { '::compute::user': } ->
  anchor { 'compute::end': }	  
}


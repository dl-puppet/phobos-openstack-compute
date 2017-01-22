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


    
  anchor { 'compute::begin': } ->
    class { '::compute::install': } ->
    class { '::compute::config': } ~>
    class { '::compute::service': } ->
    class { '::compute::user': } ->
  anchor { 'compute::end': }	  
}


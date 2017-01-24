class compute::params
{
  
      	##### PACKAGES #####
      	$package_manage              = true
      	$package_name                = [
                                       'wget',
                                       'openstack-nova-compute',
                                       'openstack-neutron-linuxbridge',
                                       'ebtables',
                                       'ipset',
                                       ]
      	$package_ensure              = 'present'

				##### CONFIG_FILES #####   
				$file_ensure          		   = 'present'    
				$file_backup          		   = '.puppet-bak'   
				$file_group           		   = '0'
				$file_mode            		   = '0644'
				$file_owner           		   = '0'
			
			  ######### SERVICES ########
				$service_name                = [
	                                     'chronyd',
	                                     'libvirtd',
	                                     'openstack-nova-compute',
                                       ]
				$service_ensure              = running            
				$service_enable              = true
				$service_hasstatus           = true
			  $service_hasrestart          = true
					
				####### USER ####### 
				$user                        = 'openstack'
				$user_ensure                 = 'present'
				$user_uid                    = '2000'
				$user_managehome             = false
				$user_shell                  = '/sbin/nologin'
 
      	####### CHRONY #######  
      	$chromy_allow                =  '192.168.122.0/24'
      	$chromy_servers              = [
																		   'controller1',
																		   ]	  
      	####### NETWORK #######  																	          
      	# /etc/sysconfig/network:
				$network_networking          = 'yes'
				#$HOSTNAME                   = <%= scope.lookupvar('::hostname') %>
				$network_nm                  = 'no'
				$network_nozeroconf          = 'yes'
				$network_gateway             = 'eth0'
		  
      	# /etc/networks:
      	$list_networks               = ['']
		
	# /etc/resolv.conf:
      	$resolv_nameserver           = '192.168.122.1'
		  
      	# /etc/sysconfig/network-script/route-eth0:
      	$route_eth0                  = [
                                       '192.168.122.0/24  via   192.168.122.1', 
                                       ]  

				# /etc/sysconfig/network-script/ifcfg-eth0:  
				$ifcfg_device                = 'eth0'
				$ifcfg_type                  = 'Ethernet'
				$ifcfg_name                  = 'eth0'
				$ifcfg_hotplug               = 'yes'
				$ifcfg_onboot                = 'yes'  
				$ifcfg_controlled            = 'no'
				$ifcfg_ipv6init              = 'no'
				$ifcfg_bootproto             = 'static'
				$ifcfg_defroute              = 'yes'
				$ifcfg_peerdns               = 'no'
      	$ifcfg_peerntp               = 'no'
      	$ifcfg_peerroutes            = 'yes'
      	$ifcfg_ip_failure            = 'no'
      	$ifcfg_network               = '192.168.122.0'
      	$ifcfg_ipaddr                = '192.168.122.210'
      	$ifcfg_netmask               = '255.255.255.0'
      	$ifcfg_gateway               = '192.168.122.1'
      	$ifcfg_broadcast             = '192.168.122.255'
      	$ifcfg_nozeroconf            = 'yes'    
      	$ifcfg_ethtool_opts          = 'autoneg off speed 100 duplex full'
      
      	# /etc/sysconfig/network-script/ifcfg-eth1:  
      	$ifcfg_device2               = 'eth1'
      	$ifcfg_name2                 = 'eth1'
		
				# /etc/host.conf:	
				$host_conf                   =  "order hosts,bind"
					
				# /etc/hosts:
				$list_host                   = ['']
				
				
				#####   NOVA COMPUTE  ######
				###"/etc/nova/nova.conf"    
			  ###[DEFAULT]
			  $nova_compute_rpc_backend    = 'rabbit'
			  $nova_compute_auth_strategy  = 'keystone'
			  $nova_compute_my_ip          = '192.168.154.210'  #MANAGEMENT_INTERFACE_IP_ADDRESS
			  $nova_compute_use_neutron    = true
			  $nova_compute_firewall_driver= 'nova.virt.firewall.NoopFirewallDriver'
			  $nova_compute_enabled_apis   = 'osapi_compute,metadata'
        $nova_compute_transport_url  = 'rabbit://openstack:RABBIT_PASS@controller1'
			  ###[oslo_messaging_rabbit]
			  $rabbit_host                 = 'controller1'
			  $rabbit_userid               = 'openstack'
			  $rabbit_password             = 'RABBIT_PASS'
			  ###[keystone_authtoken]
			  $keystone_auth_uri           = 'http://controller1:5000'
			  $keystone_auth_url           = 'http://controller1:35357'
			  $keystone_memcached_servers  = 'controller1:11211'
			  $keystone_auth_type          = 'password'
			  $keystone_project_domain_name= 'Default'
			  $keystone_user_domain_name   = 'Default'
			  $keystone_project_name       = 'service'
			  $keystone_username           = 'nova'
			  $keystone_password           = 'PWDGOP'
			  ###[vnc]
			  $vnc_enabled                 = true
			  $vncserver_listen            = '0.0.0.0'
			  $vncserver_proxyclient_address= '$my_ip'
			  $novncproxy_base_url         = 'http://controller1:6080/vnc_auto.html'
			  ###[glance]
			  $glance_api_servers          = 'http://controller1:9292'
			  ###[oslo_concurrency]
			  $oslo_lock_path              = '/var/lib/nova/tmp'
			  ###[libvirt]
			  $libvirt_virt_type           = 'qemu'
  
        ##### NEUTRON COMPUTE ######
        ###/etc/neutron/neutron.conf: 
        ###[DEFAULT]
        $neutron_transport_url       = 'rabbit://openstack:RABBIT_PASS@controller'
        $neutron_auth_strategy       = 'keystone'
        ###[keystone_authtoken]
        $neutron_auth_uri            = 'http://controller:5000'
				$neutron_auth_url            = 'http://controller:35357'
				$neutron_memcached_servers   = 'controller:11211'
				$neutron_auth_type           = 'password'
				$neutron_project_domain_name = 'Default'
				$neutron_user_domain_name    = 'Default'
				$neutron_project_name        = 'service'
				$neutron_username            = 'neutron'
				$neutron_password            = 'NEUTRON_PASS'
        ###[oslo_concurrency]
        $neutron_lock_path           = '/var/lib/neutron/tmp'

				###/etc/neutron/plugins/ml2/linuxbridge_agent.ini:       
				###[linux_bridge]
				$linuxbridge_physical_interface_mappings = 'provider:eth0' ### !!!!!!!!!!!
				###[vxlan]
				$linuxbridge_enable_vxlan    = true
				$linuxbridge_local_ip        = '192.168.122.210'
				$linuxbridge_l2_population   = true
				###[securitygroup]
				$linuxbridge_enable_security_group= true
				$linuxbridge_enable_firewall_driver= 'neutron.agent.linux.iptables_firewall.IptablesFirewallDriver'
				
				###/etc/nova/nova.conf:
				$nova_neutro_url             = 'http://controller1:9696'
				$nova_neutro_auth_url        = 'http://controller1:35357'
				$nova_neutro_auth_type       = 'password'
				$nova_neutro_project_domain_name= 'Default'
				$nova_neutro_user_domain_name= 'Default'
				$nova_neutro_region_name     = 'onepoint'
				$nova_neutro_project_name    = 'service'
				$nova_neutro_username        = 'neutron'
				$nova_neutro_password        = 'PWDGOP'


}


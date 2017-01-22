class compute::service inherits compute
{
        service { $service_name :
            ensure      => $service_ensure,
            enable      => $service_enable,
            hasstatus   => $service_hasstatus,
            hasrestart  => $service_hasrestart,
        }  
           
        service { "NetworkManager" :
            ensure       => stopped,
            enable       => false,
            
        }
}
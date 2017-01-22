class compute::install inherits compute
{
	if $package_manage == true { 

    Package {       
    ensure               => $package_ensure,         
    }
        
	    package { $package_name : } 
  }  


}
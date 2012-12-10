# == Class: thin::params
#
#   The thin configuration settings.
#
# === Parameters
#
# [*package_type*]
#   The type of packaging system.
#
# [*config_dir*]
#   The config files directory  
# 
# [*log_dir*]
#   The main log directory
#
# [*pid_dir*]
#   The main pid directory
#
# [*service_ensure*]
#   Whether a service should be running
#
# [*service*]
#   The name of the service to run
#
# [*service_enable*]
#   Whether the service should be enabled to start at boot
#
# [*service_hasstatus*]
#   Whether the service’s init script has a functional status command
#
# [*service_hasrestart*]
#   Whether the service’s init script has a functional restart command
#
# [*service_pattern*]
#   The pattern to search for in the process table
#
class thin::params {
  $package_type       = 'package'
  $config_dir         = '/etc/thin.d'
  $log_dir            = '/var/log/thin'
  $pid_dir            = '/var/run/thin'
  $service_ensure     = 'running'
  $service            = 'thin'
  $service_enable     = true
  $service_hasstatus  = false
  $service_hasrestart = true
  $service_pattern    = 'thin server'
}

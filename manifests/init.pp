# == Class: thin
#
# This class installs Thin
#
class thin (
  $config_dir         = $thin::params::config_dir,
  $log_dir            = $thin::params::log_dir,
  $pid_dir            = $thin::params::pid_dir,
  $package_type       = $thin::params::package_type,
  $service            = $thin::params::service,
  $service_ensure     = $thin::params::service_ensure,
  $service_enable     = $thin::params::service_enable,
  $service_hasstatus  = $thin::params::service_hasstatus,
  $service_hasrestart = $thin::params::service_hasrestart,
  $service_pattern    = $thin::params::service_pattern
) inherits thin::params {

  case $package_type {
    'gem'    : { include ruby::gem::thin }
    'package': { include ruby::package::thin }
    default  : { fail "Unsupported package type ${package_type}" }
  }

  # resource alias is only usable for require
  # realize Package[thin] doesn't work if thin
  # is an alias, see http://projects.puppetlabs.com/issues/4459
  Package <| alias == 'thin' |>

  file {[$config_dir, $log_dir]:
    ensure  => 'directory',
    owner   => 'root',
    group   => 'root',
  }

  file {$pid_dir:
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '1777',
  }

  file {"/etc/init.d/${service}":
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
    source => 'puppet:///modules/thin/thin.init',
  }

  service {$service:
    ensure     => $service_ensure,
    enable     => $service_enable,
    hasstatus  => $service_hasstatus,
    hasrestart => $service_hasrestart,
    pattern    => $service_pattern,
    require    => [
      File[$config_dir,$log_dir,$pid_dir],
      File["/etc/init.d/${service}"], Package['thin'],
    ],
  }

}

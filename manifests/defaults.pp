class smartd::defaults {
  $autoupdate         = false
  $package_name       = 'smartmontools'
  $service_name       = 'smartd'
  $devicescan         = true
  $devicescan_options = false
  $devices            = []
  $device_opts        = {}
  $mail_to            = 'root'
  $warning_schedule   = 'daily' # other choices: once, diminishing
  $enable_monit       = false

  case $::osfamily {
    'FreeBSD': {
      $config_file = '/usr/local/etc/smartd.conf'
    }
    'Debian', 'RedHat': {
      $config_file = '/etc/smartd.conf'
    }
    default: { fail("smartd: unsupported OS family ${::osfamily}}") }
  }
}

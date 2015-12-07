# == Class: osad::service
#
# Manages the osad service
#
# === Parameters:
#
# All parameters are presented in heira, under the osad:: namespace. For
# example, <code>osad::service_enable: true</code>.
#
# [*service_enable*]: true|false|undef
# [*service_ensure*]: running|stopped|undef
#
class osad::service (
  $service_enable = hiera( 'osad::service_enable', $osad::service_enable ),
  $service_ensure = hiera( 'osad::service_ensure', $osad::service_ensure ),
) {
  case $service_ensure {
    /^(?i)running$/,true: { $service_ensure_r = 'running' }
    /^(?i)stopped$/,false: { $service_ensure_r = 'stopped' }
    'undef': { $service_ensure_r = undef }
    default: { fail('service_ensure must be one of <running|stopped|true|false|undef>') }
  }
  case $service_enable {
    /^(?i)on$/,true: { $service_enable_r = true }
    /^(?i)off$/,false: { $service_enable_r = false }
    'undef': { $service_enable_r = undef }
    default: { fail('service_ensure must be one of <on|off|true|false|undef>') }
  }

  service { 'osad':
    ensure => $service_ensure_r,
    enable => $service_enable_r,
  }
}

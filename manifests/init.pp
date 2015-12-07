# == Class osad
#
# osad management module
#
# === Parameters
#
class osad () inherits osad::params {
  Class['osad'] ->
  class { 'osad::install': } ->
  class { 'osad::service': }
}

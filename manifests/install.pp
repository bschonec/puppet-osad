# == Class: osad::install
#
# Installs the proper package for osad
#
class osad::install {
  ensure_packages( [ 'osad' ] )
}

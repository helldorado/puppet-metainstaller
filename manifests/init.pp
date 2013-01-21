# Class: metainstaller
#
# This module manages metainstaller
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class metainstaller (
  $cli_ini_content = undef,
  $cli_ini_source = undef
) inherits metainstaller::params {
 include apt
}

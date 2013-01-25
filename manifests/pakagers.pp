# Class: metainstaller::packagers
#
# This class manages packaging software for nix distribution
#
# Parameters: packager (apt, rpm, yum, pkg...)
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class metainstaller::packagers (
  ) inherits metainstaller::params {

    include metainstaller::packagers::${packager}
}

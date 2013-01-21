Facter.add("mysql_type") do
  setcode do
        if File.exist? '/etc/puppet/metainstaller.conf'
            Facter::Util::Resolution.exec('cat /etc/puppet/metainstaller.conf')
        end
  end
end


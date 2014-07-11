require 'facter'

Facter.add(:ipa_registered) do
  setcode do
    if File.exist?('/etc/ipa/default.conf')
      'true'
    else
      'false'
    end
  end
end

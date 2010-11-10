require 'facter/util/netstat'

Facter.add(:defaultroute) do
    confine :kernel => Facter::Util::NetStat.supported_platforms
    setcode do
        Facter::Util::NetStat.get_route_value('default', 'gw')
    end
end

Facter.add(:defaultroute_iface) do
    confine :kernel => Facter::Util::NetStat.supported_platforms
    setcode do
        Facter::Util::NetStat.get_route_value('default', 'iface')
    end
end

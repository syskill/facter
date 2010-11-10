Facter.add(:osfamily) do
    confine :kernel => [:linux, :freebsd, :netbsd, :openbsd, :dragonfly,
                        :sunos, :darwin, :"hp-ux", :aix]
    setcode do "Unix" end
end

Facter.add(:osfamily) do
    setcode do Facter[:kernel].value end
end

require 'facter/operatingsystem'

Facter.add(:ostype) do
    confine :kernel => :linux
    setcode do
        case Facter[:operatingsystem].value
        when "RedHat", "CentOS", "Fedora"
            "RedHat"
        when "SuSE", "OpenSuSE", "SLES", "SLED"
            "SuSE"
        when "Mandrake", "Mandriva"
            "Mandrake"
        when "OVS", "OEL"
            "Oracle"
        else
            Facter[:operatingsystem].value
        end
    end
end

Facter.add(:ostype) do
    confine :kernel => [:freebsd, :netbsd, :openbsd, :dragonfly]
    setcode do "BSD" end
end

Facter.add(:ostype) do
    confine :kernel => :darwin
    setcode do "MacOS" end
end

Facter.add(:ostype) do
    setcode do Facter[:operatingsystem].value end
end

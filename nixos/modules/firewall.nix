{
  networking.nftables.enable = true;

  networking.nftables.tables."nixos-fw" = {
    family = "inet";
    content = ''
      table inet nixos-fw {
        set temp-ports {
          type inet_proto . inet_service
          flags interval
          comment "Temporarily opened ports"
        }

        chain rpfilter {
          type filter hook prerouting priority mangle + 10; policy drop;
          meta nfproto ipv4 udp sport . udp dport { 68 . 67, 67 . 68 } accept comment "DHCPv4 client/server"
          fib saddr . mark . iif check exists accept
          jump rpfilter-allow
        }

        chain rpfilter-allow {
        }

        chain input {
          type filter hook input priority filter; policy drop;
          iifname { "lo", "virbr0", "incusbr0" } accept comment "trusted interfaces"
          ct state vmap { invalid : drop, established : accept, related : accept, new : jump input-allow, untracked : jump input-allow }
          tcp flags & (fin | syn | rst | ack) == syn log prefix "refused connection: " level info
        }

        chain input-allow {
          # SSH allowed only from LAN
          tcp dport 22 ip saddr 192.168.1.0/24 accept comment "Allow SSH from LAN only"

          # mDNS allowed only from LAN
          udp dport 5353 ip saddr 192.168.1.0/24 accept comment "Allow mDNS from LAN only"

          # temp-ports
          meta l4proto . th dport @temp-ports accept

          # ICMP
          icmp type echo-request accept comment "allow ping"
          icmpv6 type != { nd-redirect, 139 } accept comment "Accept most ICMPv6"
          ip6 daddr fe80::/64 udp dport 546 accept comment "DHCPv6 client"
        }
      }
    '';
  };
}

require 'ipaddr'
require "socket"

## Class coming from https://github.com/lloydmeta/ansible-kafka-cluster
## Modified
class IpAssigner

  def self.next_ip(current_ip)
    IPAddr.new(current_ip).succ.to_s
  end

  def self.generate(start_ip, number_of_addresses)
    number_of_addresses.times.inject([start_ip]) { |acc, i|
      nekst = next_ip(acc.last)
      acc + [nekst]
    }
  end

  # Get the IP Address
    def self.IP_Adress
      ifaddrs = Socket.getifaddrs
      node_ip = '127.0.0.1'
      unless ifaddrs.empty?
        ifaddrs.each do |ifaddr|
          if not ifaddr.addr.nil? and ifaddr.addr.ipv4?
            addrinfo = ifaddr.addr
            node_ip = addrinfo.ip_address
            puts "addr info is #{addrinfo.ip_address}"
          end
        end
      end
      return node_ip
    end

end

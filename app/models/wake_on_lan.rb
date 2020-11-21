# frozen_string_literal: true

require 'socket'

# Wake on LAN
class WakeOnLan
  def self.send(mac, bcast = '255.255.255.255', port = 2304)
    macb = [mac.gsub(/[\-:]/, '')].pack('H*')
    packet = [0xff, 0xff, 0xff, 0xff, 0xff, 0xff].pack('C*')
    16.times { packet += macb }
    sock = UDPSocket.open
    sock.setsockopt(Socket::SOL_SOCKET, Socket::SO_BROADCAST, 1)
    sock.connect(bcast, port)
    3.times { sock.send(packet, 0) }
    sock.close
    true
  end
end

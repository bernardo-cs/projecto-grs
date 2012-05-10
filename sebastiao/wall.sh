### Flush any Existing iptable Rules and start afresh ###
iptables -F INPUT
iptables -F OUTPUT
iptables -F FORWARD



iptables -A INPUT -p tcp --dport 80 -j ACCEPT    #//apache
iptables -A INPUT -p tcp --dport 53 -j ACCEPT    #//dns - udp for large queries
iptables -A INPUT -p udp --dport 53 -j ACCEPT    #//dns - udp for small queries
iptables -A INPUT -p tcp --dport 953 -j ACCEPT   #//dns interna

iptables -A INPUT -p tcp --dport 110 -j ACCEPT #POP3
iptables -A INPUT -p tcp --dport 143 -j ACCEPT #IMAP
iptables -A INPUT -p tcp --dport 25 -j ACCEPT #SMTP

iptables -A INPUT -p icmp -j ACCEPT  #//Allow ICMP Ping packets.
iptables -A INPUT -p tcp -m tcp --tcp-flags ACK ACK -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED -j ACCEPT
iptables -A INPUT -m state --state RELATED -j ACCEPT
iptables -A INPUT -j REJECT   #//Close up firewall. All else blocked.


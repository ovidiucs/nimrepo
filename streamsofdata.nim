# Copyright 2019.
import streams
var
  ss = newStringStream("""
ns-route-server>show ip route
Codes: L - local, C - connected, S - static, R - RIP, M - mobile, B - BGP
       D - EIGRP, EX - EIGRP external, O - OSPF, IA - OSPF inter area
       N1 - OSPF NSSA external type 1, N2 - OSPF NSSA external type 2
       E1 - OSPF external type 1, E2 - OSPF external type 2
       i - IS-IS, su - IS-IS summary, L1 - IS-IS level-1, L2 - IS-IS level-2
       ia - IS-IS inter area, * - candidate default, U - per-user static route
       o - ODR, P - periodic downloaded static route, H - NHRP
       + - replicated route, % - next hop override

Gateway of last resort is 24.222.79.161 to network 0.0.0.0

O*E1  0.0.0.0/0 [110/111] via 24.222.79.161, 7w0d, GigabitEthernet0/0
                [110/111] via 24.222.79.149, 7w0d, GigabitEthernet0/1
      1.0.0.0/8 is variably subnetted, 2652 subnets, 14 masks
B        1.0.0.0/24 [200/0] via 198.32.118.206, 1w3d
B        1.0.4.0/22 [200/0] via 24.137.100.1, 4w5d
B        1.0.4.0/24 [200/0] via 24.137.100.1, 4w5d
B        1.0.5.0/24 [200/0] via 24.137.100.1, 4w5d
B        1.0.6.0/24 [200/0] via 24.137.100.1, 4w5d
B        1.0.7.0/24 [200/0] via 24.137.100.1, 4w5d
  """)
  line = ""

while ss.readline(line):
  echo line
ss.close


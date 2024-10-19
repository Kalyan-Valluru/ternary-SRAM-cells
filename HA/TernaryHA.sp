Ternary Half Adder

.lib 'gnrfet.lib' gnrfet

.options post
.options autostop
.options ingold=2     dcon=1
.options gshunt=1e-12 rmin=1e-15 
.options abstol=1e-5  absvdc=1e-4 
.options reltol=1e-2  relvdc=1e-2 
.options numdgt=4     pivot=13

.param   temp=27

.param tclk = 1n
.param tc = 2n
.param supply = 0.9v

vina a 0 pwl (0n 0v 29.9n 0v 30n 0.45v 59.9n 0.45v 60n 0.9v 90n 0.9v)
vinb b 0 pwl (0n 0v 9.9n 0v 10n 0.45v 19.9n 0.45v 20n 0.9v 29.9n 0.9v 30n 0v 39.9n 0v 40n 0.45v 49.9n 0.45v 50n 0.9v 59.9n 0.9v 60n 0v 69.9n 0v 70n 0.45v 79.9n 0.45v 80n 0.9v )

vinone one 0 pulse 0 0.45v 0 0 90n 90n

vds vdd gnd dc 0.9v

*DECODER - A

*PTI

xp1 c a vdd vdd gnrfetpmos nRib=12 N=12 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xn1 c a gnd gnd gnrfetnmos nRib=6 N=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0

*NOT

xp2 a2 c vdd vdd gnrfetpmos nRib=12 N=12 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xn2 a2 c 0 0 gnrfetnmos nRib=6 N=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0

*NTI

xn3 a0 a vdd vdd gnrfetpmos nRib=6 N=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xp3 a0 a gnd gnd gnrfetnmos nRib=12 N=12 L=32n Tox=0.95n sp=2n dop=0.001 p=0

*NOR

xn4 a1 a0 0 0 gnrfetnmos nRib=6 N=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xn5 a1 a2 0 0 gnrfetnmos nRib=6 N=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0

xp4 a1 a2 d d gnrfetpmos nRib=15 N=15 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xp5 d a0 vdd vdd gnrfetpmos nRib=15 N=15 L=32n Tox=0.95n sp=2n dop=0.001 p=0



*DECODER - B

*PTI

xp6 e b vdd vdd gnrfetpmos nRib=12 N=12 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xn6 e b gnd gnd gnrfetnmos nRib=6 N=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0

*NOT

xp7 b2 e vdd vdd gnrfetpmos nRib=12 N=12 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xn7 b2 e 0 0 gnrfetnmos nRib=6 N=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0

*NTI

xn8 b0 b vdd vdd gnrfetpmos nRib=6 N=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xp8 b0 b gnd gnd gnrfetnmos nRib=12 N=12 L=32n Tox=0.95n sp=2n dop=0.001 p=0

*NOR

xn9 b1 b0 0 0 gnrfetnmos nRib=6 N=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xn10 b1 b2 0 0 gnrfetnmos nRib=6 N=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0

xp9 b1 b2 f f gnrfetpmos nRib=15 N=15 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xp10 f b0 vdd vdd gnrfetpmos nRib=15 N=15 L=32n Tox=0.95n sp=2n dop=0.001 p=0



*NAND - 1

xn11 go a2 g g gnrfetnmos nRib=6 N=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xn12 g b0 0 0 gnrfetnmos nRib=6 N=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0

xp11 go b0 vdd vdd gnrfetpmos nRib=15 N=15 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xp12 go a2 vdd vdd gnrfetpmos nRib=15 N=15 L=32n Tox=0.95n sp=2n dop=0.001 p=0

*NAND - 2

xn13 ho a1 h h gnrfetnmos nRib=6 N=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xn14 h b1 0 0 gnrfetnmos nRib=6 N=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0

xp13 ho b1 vdd vdd gnrfetpmos nRib=15 N=15 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xp14 ho a1 vdd vdd gnrfetpmos nRib=15 N=15 L=32n Tox=0.95n sp=2n dop=0.001 p=0

*NAND - 3

xn15 io a0 i i gnrfetnmos nRib=6 N=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xn16 i b2 0 0 gnrfetnmos nRib=6 N=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0

xp15 io b2 vdd vdd gnrfetpmos nRib=15 N=15 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xp16 io a0 vdd vdd gnrfetpmos nRib=15 N=15 L=32n Tox=0.95n sp=2n dop=0.001 p=0

*NAND - 4

xn17 jo a1 j j gnrfetnmos nRib=6 N=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xn18 j b0 0 0 gnrfetnmos nRib=6 N=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0

xp17 jo b0 vdd vdd gnrfetpmos nRib=15 N=15 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xp18 jo a1 vdd vdd gnrfetpmos nRib=15 N=15 L=32n Tox=0.95n sp=2n dop=0.001 p=0

*NAND - 5

xn19 ko a0 k k gnrfetnmos nRib=6 N=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xn20 k b1 0 0 gnrfetnmos nRib=6 N=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0

xp19 ko b1 vdd vdd gnrfetpmos nRib=15 N=15 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xp20 ko a0 vdd vdd gnrfetpmos nRib=15 N=15 L=32n Tox=0.95n sp=2n dop=0.001 p=0

*NAND - 6

xn21 lo a2 l l gnrfetnmos nRib=6 N=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xn22 l b2 0 0 gnrfetnmos nRib=6 N=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0

xp21 lo b2 vdd vdd gnrfetpmos nRib=15 N=15 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xp22 lo a2 vdd vdd gnrfetpmos nRib=15 N=15 L=32n Tox=0.95n sp=2n dop=0.001 p=0

*NAND - 7

xn23 mo a2 m m gnrfetnmos nRib=6 N=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xn24 m b1 0 0 gnrfetnmos nRib=6 N=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0

xp23 mo b1 vdd vdd gnrfetpmos nRib=15 N=15 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xp24 mo a2 vdd vdd gnrfetpmos nRib=15 N=15 L=32n Tox=0.95n sp=2n dop=0.001 p=0

*NAND - 8

xn25 no a1 n n gnrfetnmos nRib=6 N=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xn26 n b2 0 0 gnrfetnmos nRib=6 N=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0

xp25 no b2 vdd vdd gnrfetpmos nRib=15 N=15 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xp26 no a1 vdd vdd gnrfetpmos nRib=15 N=15 L=32n Tox=0.95n sp=2n dop=0.001 p=0



*NAND - 1 (3 ips)

xn27 po go o o gnrfetnmos nRib=8 N=8 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xn28 o ho p p gnrfetnmos nRib=8 N=8 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xn29 p io 0 0 gnrfetnmos nRib=8 N=8 L=32n Tox=0.95n sp=2n dop=0.001 p=0

xp27 po go vdd vdd gnrfetpmos nRib=15 N=15 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xp28 po ho vdd vdd gnrfetpmos nRib=15 N=15 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xp29 po io vdd vdd gnrfetpmos nRib=15 N=15 L=32n Tox=0.95n sp=2n dop=0.001 p=0

*NAND - 2 (3 ips)

xn30 ro jo q q gnrfetnmos nRib=8 N=8 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xn31 q ko r r gnrfetnmos nRib=8 N=8 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xn32 r lo 0 0 gnrfetnmos nRib=8 N=8 L=32n Tox=0.95n sp=2n dop=0.001 p=0

xp30 ro jo vdd vdd gnrfetpmos nRib=15 N=15 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xp31 ro ko vdd vdd gnrfetpmos nRib=15 N=15 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xp32 ro lo vdd vdd gnrfetpmos nRib=15 N=15 L=32n Tox=0.95n sp=2n dop=0.001 p=0

*NAND - 3 (3 ips)

xn33 t0 lo s s gnrfetnmos nRib=8 N=8 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xn34 s mo t t gnrfetnmos nRib=8 N=8 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xn35 t no 0 0 gnrfetnmos nRib=8 N=8 L=32n Tox=0.95n sp=2n dop=0.001 p=0

xp33 t0 lo vdd vdd gnrfetpmos nRib=15 N=15 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xp34 t0 mo vdd vdd gnrfetpmos nRib=15 N=15 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xp35 t0 no vdd vdd gnrfetpmos nRib=15 N=15 L=32n Tox=0.95n sp=2n dop=0.001 p=0



*NOT

xp36 u po vdd vdd gnrfetpmos nRib=12 N=12 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xn36 u po 0 0 gnrfetnmos nRib=6 N=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0



*TNAND - 1

xn37 v one 0 0 gnrfetnmos nRib=6 N=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xn38 w ro v v gnrfetnmos nRib=6 N=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0

xp37 w ro vdd vdd gnrfetpmos nRib=15 N=15 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xp38 w one vdd vdd gnrfetpmos nRib=15 N=15 L=32n Tox=0.95n sp=2n dop=0.001 p=0

xn41 zo vdd w w gnrfetnmos nRib=12 N=12 L=32n Tox=0.95n sp=2n dop=0.001 p=0

xn39 y one 0 0 gnrfetnmos nRib=15 N=15 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xn40 z ro y y gnrfetnmos nRib=15 N=15 L=32n Tox=0.95n sp=2n dop=0.001 p=0

xp39 z ro vdd vdd gnrfetpmos nRib=6 N=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xp40 z one vdd vdd gnrfetpmos nRib=6 N=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0

xp41 zo 0 z z gnrfetpmos nRib=12 N=12 L=32n Tox=0.95n sp=2n dop=0.001 p=0

*TNAND - 2

xn42 c1 one 0 0 gnrfetnmos nRib=6 N=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xn43 d1 t0 c1 c1 gnrfetnmos nRib=6 N=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0

xp42 d1 t0 vdd vdd gnrfetpmos nRib=15 N=15 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xp43 d1 one vdd vdd gnrfetpmos nRib=15 N=15 L=32n Tox=0.95n sp=2n dop=0.001 p=0

xn46 g1 vdd d1 d1 gnrfetnmos nRib=12 N=12 L=32n Tox=0.95n sp=2n dop=0.001 p=0

xn44 e1 one 0 0 gnrfetnmos nRib=15 N=15 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xn45 f1 t0 e1 e1 gnrfetnmos nRib=15 N=15 L=32n Tox=0.95n sp=2n dop=0.001 p=0

xp44 f1 t0 vdd vdd gnrfetpmos nRib=6 N=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xp45 f1 one vdd vdd gnrfetpmos nRib=6 N=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0

xp46 g1 0 f1 f1 gnrfetpmos nRib=12 N=12 L=32n Tox=0.95n sp=2n dop=0.001 p=0

*TNAND - 3

xn47 h1 u 0 0 gnrfetnmos nRib=6 N=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xn48 i1 zo h1 h1 gnrfetnmos nRib=6 N=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0

xp47 i1 zo vdd vdd gnrfetpmos nRib=15 N=15 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xp48 i1 u vdd vdd gnrfetpmos nRib=15 N=15 L=32n Tox=0.95n sp=2n dop=0.001 p=0

xn51 sum vdd i1 i1 gnrfetnmos nRib=12 N=12 L=32n Tox=0.95n sp=2n dop=0.001 p=0

xn49 j1 u 0 0 gnrfetnmos nRib=15 N=15 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xn50 k1 zo j1 j1 gnrfetnmos nRib=15 N=15 L=32n Tox=0.95n sp=2n dop=0.001 p=0

xp49 k1 zo vdd vdd gnrfetpmos nRib=6 N=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xp50 k1 u vdd vdd gnrfetpmos nRib=6 N=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0

xp51 sum 0 k1 k1 gnrfetpmos nRib=12 N=12 L=32n Tox=0.95n sp=2n dop=0.001 p=0



*STI

xn52 0 g1 l1 l1 gnrfetnmos nRib=6 N=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xp52 l1 g1 vdd vdd gnrfetpmos nRib=15 N=15 L=32n Tox=0.95n sp=2n dop=0.001 p=0

xn54 carry vdd l1 l1 gnrfetnmos nRib=12 N=12 L=32n Tox=0.95n sp=2n dop=0.001 p=0

xn53 m1 g1 0 0 gnrfetnmos nRib=15 N=15 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xp53 vdd g1 m1 m1 gnrfetpmos nRib=6 N=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0

xp54 carry 0 m1 m1 gnrfetpmos nRib=12 N=12 L=32n Tox=0.95n sp=2n dop=0.001 p=0



.op all
.tran 200p 90n
.meas tran avgpower AVG power from = 1ns to = 90ns
.meas tran peakpower MAX power from = 1ns to = 90ns
.plot tran v(a) v(b) v(sum) v(carry)
.options post
.end
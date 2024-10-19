* NAND Gate using GNRFET Technology

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

* Input Pulse Definitions
vina a 0 pwl (0n 0v 29.9n 0v 30n 0.45v 59.9n 0.45v 60n 0.9v 90n 0.9v)
vinb b 0 pwl (0n 0v 9.9n 0v 10n 0.45v 19.9n 0.45v 20n 0.9v 29.9n 0.9v 30n 0v 39.9n 0v 40n 0.45v 49.9n 0.45v 50n 0.9v 59.9n 0.9v 60n 0v 69.9n 0v 70n 0.45v 79.9n 0.45v 80n 0.9v)

* Power Supply
vds vdd gnd dc 0.9v

* NMOS Transistors
xn1 p a 0 0 gnrfetnmos nRib=6 N=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xn2 p b 0 0 gnrfetnmos nRib=6 N=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0

* PMOS Transistors
xp1 p b q q gnrfetpmos nRib=15 N=15 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xp2 q a vdd vdd gnrfetpmos nRib=15 N=15 L=32n Tox=0.95n sp=2n dop=0.001 p=0

* Additional NMOS for pull-down path
xn3 r a 0 0 gnrfetnmos nRib=15 N=15 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xn4 r b 0 0 gnrfetnmos nRib=15 N=15 L=32n Tox=0.95n sp=2n dop=0.001 p=0

* PMOS Pull-Up Path
xp3 r b s s gnrfetpmos nRib=6 N=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xp4 s a vdd vdd gnrfetpmos nRib=6 N=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0

* Output Node
xp5 op 0 r r gnrfetpmos nRib=12 N=12 L=32n Tox=0.95n sp=2n dop=0.001 p=0

* Analysis Commands
.OP ALL
.TRAN 200P 90N
.meas tran avgpower AVG power from = 1ns to = 90ns
.meas tran peakpower MAX power from = 1ns to = 90ns
.plot tran v(a) v(b) v(op)
.end

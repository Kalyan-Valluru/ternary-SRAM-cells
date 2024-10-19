* 11T Ternary SPI SRAM Cell using GNRFETs
.lib 'gnrfet.lib' gnrfet

.options post
.options autostop
.options ingold=2 dcon=1
.options gshunt=1e-12 rmin=1e-15 
.options abstol=1e-5  absvdc=1e-4 
.options reltol=1e-2  relvdc=1e-2 
.options numdgt=4     pivot=13

.param temp=27

* Clock period and supply voltage
.param tclk = 1n
.param tc = 2n
.param supply = 1.2v

* Piecewise linear voltage source for ternary input signals (0, 0.6V, 1.2V)
vina a 0 pwl (0n 0v 29.9n 0v 30n 0.6v 59.9n 0.6v 60n 1.2v 90n 1.2v)
vds vdd gnd dc 1.2v

* Access Transistors
xn1 0 a z z gnrfetnmos nRib=6 N=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xp1 z a vdd vdd gnrfetpmos nRib=15 N=15 L=32n Tox=0.95n sp=2n dop=0.001 p=0

* Pull-down NMOS transistors for ternary state switching
xn2 y a 0 0 gnrfetnmos nRib=12 N=12 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xn3 op vdd y y gnrfetnmos nRib=12 N=12 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xn4 d a 0 0 gnrfetnmos nRib=10 N=10 L=32n Tox=0.95n sp=2n dop=0.001 p=0

* Pull-up PMOS transistors for ternary state switching
xp2 vdd a y y gnrfetpmos nRib=6 N=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xp3 op 0 y y gnrfetpmos nRib=12 N=12 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xp4 d vdd y y gnrfetpmos nRib=10 N=10 L=32n Tox=0.95n sp=2n dop=0.001 p=0

* Additional NMOS and PMOS transistors for improved stability
xn5 x a 0 0 gnrfetnmos nRib=10 N=10 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xp5 out a vdd vdd gnrfetpmos nRib=10 N=10 L=32n Tox=0.95n sp=2n dop=0.001 p=0

* Cross-coupled inverters to maintain ternary state (0, 0.6V, 1.2V)
xn6 out vdd y y gnrfetnmos nRib=10 N=10 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xp6 out a vdd vdd gnrfetpmos nRib=12 N=12 L=32n Tox=0.95n sp=2n dop=0.001 p=0

* Output voltage storage node
xn7 out vdd op op gnrfetnmos nRib=12 N=12 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xp7 op 0 out out gnrfetpmos nRib=12 N=12 L=32n Tox=0.95n sp=2n dop=0.001 p=0

* Power measurement across Vdd (average power consumption)
.meas tran avgpower AVG power from = 1ns to = 90ns

* Simulation commands
.OP ALL
.TRAN 200P 90N
.plot tran v(a) v(out) v(op)
.end

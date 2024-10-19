STI Gate
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
vds vdd gnd dc 0.9v

xn1 0 a z z gnrfetnmos nRib=6 N=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xp1 z a vdd vdd gnrfetpmos nRib=15 N=15 L=32n Tox=0.95n sp=2n dop=0.001 p=0

xn3 op vdd z z gnrfetnmos nRib=12 N=12 L=32n Tox=0.95n sp=2n dop=0.001 p=0

xn2 y a 0 0 gnrfetnmos nRib=15 N=15 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xp2 vdd a y y gnrfetpmos nRib=6 N=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0

xp3 op 0 y y gnrfetpmos nRib=12 N=12 L=32n Tox=0.95n sp=2n dop=0.001 p=0

.OP ALL
.TRAN 200P 90N
*.meas tran avgpower AVG power from = 1ns to = 90ns
*.meas tran peakpower MAX power from = 1ns to = 90ns
.plot tran v(a) v(op)
.options post
.end
NTI Gate
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

*vdd 2 0 0.9
vina a 0 pwl (0n 0v 29.9n 0v 30n 0.45v 59.9n 0.45v 60n 0.9v 90n 0.9v)
vds vdd gnd dc 0.9v

xn op a vdd vdd gnrfetpmos nRib=6 N=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0
xp op a gnd gnd gnrfetnmos nRib=12 N=12 L=32n Tox=0.95n sp=2n dop=0.001 p=0

.op all
.tran 200p 90n
.meas tran avgpower AVG power from = 1ns to = 90ns
.meas tran peakpower MAX power from = 1ns to = 90ns
.plot tran v(a) v(op)
.options post
.end
sr	=	44100
kr	=	22050
ksmps	=	2
nchnls	=	4

	instr 1
k1	linen	p4, p7, p3, p8 
k2	line	p5, p3, p6
k3	line	p9, p3, p10
k4	line	p11, p3, p12
a1	oscil	k1, k2, 1
	outs	a1*k3*k4, a1*(1-k3)*k4, a1*k3*(1-k4), a1*(1-k3)*(1-k4)
	endin

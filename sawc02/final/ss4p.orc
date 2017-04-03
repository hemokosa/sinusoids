sr	=	44100
kr	=	22050
ksmps	=	2
nchnls	=	4

	instr 1
k1	linen	p4, p7, p3, p8 
k2	line	p5, p3, p6
a1	oscil	k1, k2, 1
	outs	a1*p9*p10, a1*(1-p9)*p10, a1*p9*(1-p10), a1*(1-p9)*(1-p10)
	endin

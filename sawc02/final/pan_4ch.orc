sr	=	44100
kr	=	4410
ksmps	=	10
nchnls	=	4

	instr 1
ipanfreq	=	p9
k1	linen	p4, p7, p3, p8 
k2	line	p5, p3, p6
kpan	oscil	.5, ipanfreq, 1
kpan2	oscil	.5, ipanfreq, 1, 0.25
kpanlfo		=	kpan+.5
kpanlfo2	=	kpan2+.5
a1	oscil	k1, k2, 1
outq	a1* kpanlfo* kpanlfo2, a1* (1 -kpanlfo)* kpanlfo2, a1* kpanlfo*(1-kpanlfo2),a1*(1 -kpanlfo)* (1-kpanlfo2)
	endin

;dot-line-plane

sr		=	44100
kr		=	44100
ksmps		=	1
nchnls		=	2

;dot
		instr 1
itable		=	8
idur1		=	(itable - 1) /sr			
idur2		=	1/sr				 				
ifreq		=	sr/itable
iamp		= 	p4 * 32767
ipan		= 	p5

a1		linseg	ifreq, idur1, ifreq, idur2, 0, 1, 0
a2		oscil	iamp, a1, 1
		outs	a2 * (1 - ipan), a2 * ipan
		endin

;line
		instr 2
idur		=	p3
iamp1		=	p4*32767
iamp2		=	p5*32767
if1		=	p6
icf1		=	p7
icf2		=	p8
iatk		=	p9
irel		=	p10
ipan1		= 	p11
ipan2		= 	p12

kamp		line	iamp1, idur, iamp2
kenv		linen	kamp, iatk, idur, irel
kcf		line	icf1, idur, icf2
kpan		line	ipan1, idur, ipan2
a1		oscili	kenv, kcf, if1
		outs	a1 * (1 - kpan), a1 * kpan
		endin


;plane
		instr 3
idur		=	p3
iamp1		=	p4
iamp2		=	p5
ifrq		=	p6
icf1		=	p7
icf2		=	p8
ibw1		=	p9
ibw2		=	p10
iatk		=	p11
irel		=	p12
ipan1		= 	p13
ipan2		= 	p14

kamp		line	iamp1, idur, iamp2
kenv		linen	kamp, iatk, idur, irel
kcf		line	icf1, idur, icf2
kbw		line	ibw1, idur, ibw2
kpan		line	ipan1, idur, ipan2
anoise		rand	ifrq
afilt		reson	anoise, kcf, kbw, 2
		outs	kenv * afilt * (1 - kpan), kenv * afilt * kpan
		endin

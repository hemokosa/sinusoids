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
		outs	a2 * ipan, a2 * (1 - ipan)
			endin

;line
		instr 2
idur		=	p3
iamp		=	p4*32767
icf1		=	p5
icf2		=	p6
if1		=	p7
irise		=	p8
idec		=	p9
ipan		= 	p10

a2		linen	iamp, irise, idur, idec
kcf		line	icf1, idur, icf2
a1		oscili	a2, kcf, if1
		outs	a1 * ipan, a1 * (1 - ipan)
		endin

;plane
		instr 3
idur		=	p3
iamp		=	p4 * 32767
ifrq		=	p5
iatk		=	p6
irel		=	p7
icf1		=	p8
icf2		=	p9
ibw1		=	p10
ibw2		=	p11
ipan		=	p12

kenv		linen	iamp, iatk, idur, irel
anoise		rand	ifrq
kcf		line	icf1, idur, icf2
kbw		line	ibw1, idur, ibw2
afilt		reson	anoise, kcf, kbw, 2
		outs	afilt*kenv*ipan, afilt*kenv*(1.0-ipan)
		endin

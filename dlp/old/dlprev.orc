;dot-line-plane

sr		=	44100
kr		=	44100
ksmps		=	1
nchnls		=	2

gifeed		=	.5
gilp1		=	1/10
gilp2		=	1/23
gilp3		=	1/41
giroll		=	3000
gadrysig  	init	0

;dot
		instr 1
itable		=	8
idur1		=	(itable - 1) /sr			
idur2		=	1/sr				 				
ifreq		=	sr/itable
iamp		= 	p4 * 32767
ipan		= 	p5
iwetamp		=	p6
idryamp		=	1-iwetamp

a1		linseg	ifreq, idur1, ifreq, idur2, 0, 1, 0
a2		oscil	iamp, a1, 1
gadrysig		=	gadrysig+a2*iwetamp
		outs	a2 * ipan * idryamp, a2 * (1 - ipan) * idryamp
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
iwetamp		=	p11
idryamp		=	1-iwetamp

a2		linen	iamp, irise, idur, idec
kcf		line	icf1, idur, icf2
a1		oscili	a2, kcf, if1
gadrysig		=	gadrysig+a1*iwetamp
		outs	a1* ipan* idryamp, a1* (1 - ipan) * idryamp
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
iwetamp		=	p13
idryamp		=	1-iwetamp

kenv		linen	iamp, iatk, idur, irel
anoise		rand	ifrq
kcf		line	icf1, idur, icf2
kbw		line	ibw1, idur, ibw2
afilt		reson	anoise, kcf, kbw, 2
gadrysig		=	gadrysig+afilt*iwetamp
		outs	afilt*kenv*ipan*idryamp, afilt*kenv*(1.0-ipan)*idryamp
		endin

;reverve
		 instr     101
atmp		alpass	gadrysig, 1.7, .1
aleft		alpass	atmp, 1.01, .07
atmp		alpass	gadrysig, 1.5, .2
aright		alpass	atmp, 1.33, .05

kdel1		randi	.01, 1, .666
kdel1		=	kdel1+.1
addl1		delayr	.3
afeed1		deltapi	kdel1
afeed1		=	afeed1+gifeed*aleft
		delayw    aleft

kdel2		randi	.01,. 95, .777
kdel2		=	kdel2+.1
addl2		delayr	.3
afeed2		deltapi	kdel2
afeed2		=	afeed2+gifeed*aright
		delayw	aright

aglobin		=	(afeed1+afeed2)*.05
atap1		comb	aglobin, 3.3, gilp1
atap2		comb	aglobin, 3.3, gilp2
atap3		comb      aglobin, 3.3, gilp3
aglobrev		alpass	atap1+atap2+atap3, 2.6, .085
aglobrev		tone	aglobrev, giroll
kdel3		randi	.003, 1,. 888
kdel3		=	 kdel3+ .05
addl3		delayr	.2
agr1		deltap	kdel3
		delayw	aglobrev

kdel4		randi	.003, 1, .999
kdel4		=	kdel4+ .05
addl4		delayr	.2
agr2		deltapi	kdel4
		delayw	aglobrev

arevl		=	agr1+afeed1
arevr		=	agr2+afeed2
		outs	arevl, arevr
gadrysig		=	0
		endin





  sr        =           44100
  kr        =           44100
  ksmps     =           1
  nchnls    =           2

instr 1
  ifreqfreq =           p6
  ipanfreq  =           p9
  iampamp   =           p11
  iampfreq  =           p12

  k1        linen       p4, p7, p3, p8
  kfreq     oscil       .01*p5/p6, ifreqfreq, 1
  kfreqlfo  =           kfreq+p5
  kpan      line	p9, p3, p10
  kamp      oscil       iampamp, iampfreq, 1
  kamplfo   =           kamp+.5
  a1        oscil       k1*kamplfo, kfreqlfo, 1
            outs        a1*kpan, a1*(1.-kpan)
endin 


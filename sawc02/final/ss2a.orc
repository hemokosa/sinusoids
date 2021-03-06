  sr        =           44100
  kr        =           44100
  ksmps     =           1
  nchnls    =           2

instr 1
  ifreqfreq =           p6
  ipanfreq  =           p9
  iampamp   =           p10
  iampfreq  =           p11

  k1        linen       p4, p7, p3, p8
  kfreq     oscil       .01*p5/p6, ifreqfreq, 1
  kfreqlfo  =           kfreq+p5
  kpan      oscil       .5, ipanfreq, 1
  kpanlfo   =           kpan+.5
  kamp      oscil       iampamp, iampfreq, 1
  kamplfo   =           kamp+.5
  a1        oscil       k1*kamplfo, kfreqlfo, 1
            outs        a1*kpanlfo, a1*(1.-kpanlfo)
endin 


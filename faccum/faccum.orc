  sr        =           44100
  kr        =           44100
  ksmps     =           1
  nchnls    =           2

instr 1

  vib       oscil       p5, p6, 1
  kfreq     =           p5 + vib
  env       linen       p4, p7, p3, p8
  tre       oscil       p11, p12, 1
  xamp      =           env * (tre + 1.0) * 0.5
  pan       line	      p9, p3, p10

  a1        foscili     xamp, kfreq, xcar, xmod, kndx, 1
            outs        a1 * pan, a1 * (1.0 - pan)
endin

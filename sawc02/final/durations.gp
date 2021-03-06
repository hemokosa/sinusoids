set out
set term x11
set view 100, 100, 1, 1
set noxtics
set noytics
set noztics
set noborder
set nokey
splot "durations.dat" using 2:($2+$3):5 with lines
replot"durations.dat" using 2:($2+$3):($6*1000) with dots
replot"durations.dat" using 2:($2+$3):($7*20000) with dots
replot"durations.dat" using 2:($2+$3):($8*20000) with dots
replot"durations.dat" using 2:($2+$3):($9*20000) with dots
replot"durations.dat" using 2:($2+$3):($10*20000) with dots
replot"durations.dat" using 2:($2+$3):($11*50000) with dots
replot"durations.dat" using 2:($2+$3):($12*10000) with dots
set term post enh color 22
set out "durations.ps"
replot
set term jpeg size 1240,1024
set out "durations.jpg"
replot
set term png color
set out "durations.png"
replot
set term pbm color
set out "durations.pbm"
replot
set out
set term x11








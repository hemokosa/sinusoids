set view 45, 45, 1, 1
set noxtics
set noytics
set noztics
set noborder
set nokey
splot "durations.dat" using 2:($2+$3):5 with lines
replot"durations.dat" using 2:($2+$3):($6*1000) with dots

reset
set xr [*:*]
set yr [0:*]
set ylabel "Frequencia"
set xlabel "Numero aleatorio"
set nokey
set notitle
set size 0.6,0.6
set term postscript eps mono
set out "../eps/transpose/squared.eps"
plot '../data/transpose/squared.dat' using ($1):($2) t ""

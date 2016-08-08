reset
set xr [*:*]
set yr [*:*]
set ylabel "Frequencia"
set xlabel "Taxa de sucesso (%)"
set nokey
set notitle
set size 0.6,0.6
set term postscript eps mono
set out "../eps/transpose/binomial.eps"
plot '../data/transpose/binomial.dat' using ($1):($2) t "" w boxes

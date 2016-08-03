reset
set xr [*:*]
set yr [*:*]
#set multiplo
#set data style dots
set ylabel "Frequencia"
set xlabel "Taxa de sucesso (%)"
set nokey
#set encoding iso_8859_1
set notitle
set size 0.6,0.6
set term postscript eps mono
set out "../eps/transpose/binomial.eps"
plot '../data/transpose/binomial.dat' using ($1):($2) t "" w boxes

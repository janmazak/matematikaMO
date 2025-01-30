

beginfig(1);

u := 3cm;
pair A, B, C, K, L, M, N, E;

A = (0,0);
B = (1u, 0);
C = (.6u, .7u);

L = .5[A, C];
N = .5[B, C];
M = whatever[L, N];
M-C = whatever * ((A-B) rotated 90);
K-L = L-M;
E-N = N-M;

drawarrow ((C+M+L)/3)..(.5[C,K])..((A+K+L)/3);
drawarrow ((C+M+N)/3)..(.5[C,E])..((B+E+N)/3);
draw A--B--C--A;
draw A--K--L dashed evenly; draw N--E--B dashed evenly;
pickup pencircle scaled 2pt;
draw L--N; draw M--C;

endfig;

beginfig(2);

u := 4cm;
pair A, B, C, K, L, M, N, E;
pair CC, KK, LL, MM, NN, EE;

A = (.07u,.6u);
B = (1u, 0);
C = (.8u, .7u);

L = .5[A, C];
N = .5[B, C];
M = whatever[L, N];
M-C = whatever * ((A-B) rotated 90);
K-L = L-M;
E-N = N-M;

drawarrow ((C+M+L)/3)..(.5[C,K])..((A+K+L)/3);
drawarrow ((C+M+N)/3)..(.5[C,E])..((B+E+N)/3);
draw A--B--C--A;
draw A--K--L dashed evenly; draw N--E--B dashed evenly;
pickup pencircle scaled 2pt;
draw L--N; draw M--C;
pickup defaultpen;

CC = (0, 0);

LL = .5[A, CC];
NN = .5[B, CC];
MM = whatever[LL, NN];
MM-CC = whatever * ((A-B) rotated 90);
KK-LL = LL-MM;
EE-NN = NN-MM;

drawarrow ((CC+MM+LL)/3)..(.8[CC,KK])..((A+KK+LL)/3);
drawarrow ((CC+MM+NN)/3)..(.5[CC,EE])..((B+EE+NN)/3);
draw A--B--CC--A;
draw A--KK--LL dashed evenly; draw NN--EE--B dashed evenly;
pickup pencircle scaled 2pt;
draw LL--NN; draw MM--CC;

endfig;


end.
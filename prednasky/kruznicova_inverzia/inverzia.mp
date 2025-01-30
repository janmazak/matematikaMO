
def arc(expr first,point,second,radius)=
begingroup
save t,v,p; numeric t,v; path p;
hide(p= (fullcircle scaled 2radius) rotated angle5(first-point) shifted point;
(t,v)= p intersectiontimes (point--5[point,second]))
cutdraw subpath(0,t) of p
endgroup
enddef;

def Ruhol(expr bod,uhol,polomer)= % pravy uhol
  draw quartercircle scaled polomer rotated uhol shifted bod;
  drawdot 0.3*polomer*dir45 rotated uhol shifted bod
    withpen currentpen scaled 3;
enddef;

% zrata suradnice stredu opisanej kruznice
vardef circumcenter(expr A, B, C)= %
begingroup
  save x, y;
  z1=A; z2=B; z3=C; z12=1/2[z1,z2]; z23=1/2[z2,z3];
  z0-z12=whatever*((z1-z2) rotated 90);
  z0-z23=whatever*((z3-z2) rotated 90);
  z0
endgroup
enddef;

% zrata suradnice stredu vpisanej kruznice
vardef incenter(expr A, B, C)= %
begingroup
  save x, y;
  numeric a,b,c;
  a = length(B-C);
  b = length(A-C);
  c = length(A-B);
  z1 = (1/2 * (b+c-a)/b) [B, C];
  z2 = (1/2 * (c+a-b)/c) [C, A];
  z3 = (1/2 * (a+b-c)/a) [A, B];
  z0 = circ_center(z1,z2,z3);
  z0
endgroup
enddef;

% nakresli bod ako prazdny kruzok
def bod(expr A) =
    pickup pencircle scaled 2.5pt;
    draw A;
    pickup pencircle scaled 1pt;
    draw A withcolor white;
enddef;


% rovnobeznost; nakresli dve ciarky pri bode M tak, aby zvierali s priamkou
% (smer urceny uhlom alfa) rozumny uhol
vardef rovnobeznost (expr bod, alfa, size) =
begingroup
        save x, y;
        picture p;
        z0 = (0,0);
        z1 = (1*size,0);
        z2 = (1.3*size, 0.8*size);
        z3-z0 = z2-z1;
        p = image (
                pickup pencircle scaled .5pt;
                draw z0--z3;
                draw z1--z2;
        );
        draw p xscaled .4 slanted .4 rotated alfa shifted (bod - 1/2 [z0, z2]);
endgroup
enddef;


beginfig(1)

u := 1cm;

pair O, TT, T, A, B, C, D, S, SS;

T = (0, 0);
A = (-u, 2u);
B = (1.5u, 2.4u);

S = circumcenter(A, B, T);
O = whatever[A,B];
O-T = whatever * ((S-T) rotated 90);
TT = .4[O, T];
C = (length(O-TT)/length(O-T))[O, A];
D = (length(O-TT)/length(O-T))[O, B];
SS = circumcenter(C, D, TT);

draw O--(1.2[O, T]);
draw fullcircle scaled 2length(S-A) shifted S;
draw fullcircle scaled 2length(SS-C) shifted SS;
draw O--(1.1[O, B]);
draw (2.2[TT,C])--(1.8[C,TT]);
draw (1.8[TT,D])--(1.8[D,TT]);
draw (1.5[T,A])--(1.3[A,T]);
draw (1.2[T,B])--(1.2[B,T]);

arc(C, TT, O, .4u);
arc(C, TT, O, .5u);
arc(A, T, O, .4u);
arc(A, T, O, .5u);
arc(O, B, T, .4u);
arc(O, B, T, .5u);

rovnobeznost(1.5[TT, C] + (-.08u, .2u), -10, .25u);
rovnobeznost(1.25[T, A] + (-.08u, .2u), -10, .25u);

label.ulft(btex $A$ etex, A + (-.1u, 0));
label.top(btex $B$ etex, B + (0, .1u));
label.ulft(btex $C$ etex, C + (-.1u, 0));
label.top(btex $D$ etex, D + (0, .1u));
label.llft(btex $T$ etex, T + (-.1u, 0));
label.llft(btex $T'$ etex, TT + (-.1u, 0));
label.top(btex $O$ etex, O);
label.top(btex $k$ etex, S + (-.45u, 1.4u));
label.top(btex $\ell$ etex, SS + (-.2u, .6u));

currentpicture := currentpicture rotated -angle(S-O);

endfig;

beginfig(2);

u := 1.4cm;

pair O, A, B, AA, BB, M, MM;
numeric r;
path l;

O = (0, 0);
A = (2.5u, 0);
B = (5u, 0);
AA = (2u, 0);

r = sqrt(length(O-A) * length(O-AA));
ypart BB = 0; xpart BB = r * r / length(O-B); 
l = fullcircle scaled length(A-B) shifted .5[A, B];
M = point 3.1 of l;
MM = (r * r / length(O-M) / length(O-M))[O, M];

draw O--(1.02[O, B]);
draw quartercircle scaled 2r shifted O rotated -45 dashed evenly;
draw l;
draw O--(1.1[O, M]);
draw BB--MM--AA; draw B--M--A;

label.top(btex $O$ etex, O);
label.ulft(btex $M$ etex, M);
label.lrt(btex $A$ etex, A);
label.llft(btex $B$ etex, B);
label.bot(btex $A'$ etex, AA);
label.bot(btex $B'$ etex, BB);
label.top(btex $M'$ etex, MM);

arc(B, A, M, .35u);
label.urt(btex $\alpha$ etex, A + (.07u, 0));
arc(B, O, M, .95u);
label.urt(btex $\varphi$ etex, O + (.7u, -.02u));
arc(M, B, A, 1u);
label.ulft(btex $\beta$ etex, B + (-.7u, -.03u));
Ruhol(M, angle(A-M), .45u);

label.top(btex $k$ etex, AA + (0, 1.3u));
label.top(btex $\ell$ etex, B + (-.5u, 1.1u));
bod(.5[A, B]);
label.bot(btex $S$ etex, .5[A, B] + (0, -.03u));

endfig;

beginfig(3);

u := 4 cm;

pair O, P, PP, R, S;
numeric r;
path k;

O = (0, 0);
k = fullcircle scaled u shifted O;
R = point 1.7 of k;
S = point (8-1.7) of k;
r = length (O-R);
P = circumcenter (O, R, S);
PP = (r * r / length(O-P) / length(O-P))[O, P];
draw k;
draw O--P--R--O dashed evenly;
draw PP--R dashed evenly;
draw subpath (0, 1.35) of fullcircle scaled 2length(P-R) rotated 150 shifted P;
draw subpath (0, 1) of fullcircle scaled 2r rotated -112.5 shifted R;
draw subpath (0, 1) of fullcircle scaled 2r rotated 67.5 shifted S;

label.urt(btex $S$ etex, S + (0, .03u));
label.ulft(btex $R$ etex, R + (0, .04u));
label.bot(btex $M$ etex, P);
label.llft(btex $O$ etex, O + (0, -.02u));
label.bot(btex $M'$ etex, PP + (0, -.02u));

endfig;

end.

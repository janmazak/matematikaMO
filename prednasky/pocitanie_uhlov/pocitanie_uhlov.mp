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

def odot expr bod=
  erase fill fullcircle scaled .03u shifted bod;
  fill fullcircle scaled .03u shifted bod;
enddef;

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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

beginfig(1);

u := 4 cm;

pair A, B, C, S;
A = (0, 0);
B = (u, 0);
S = .5[A,B];
C-S = (B-S) rotated 50;
draw A--B--C--A;
draw halfcircle scaled length(A-B) shifted S;
arc(B, A, C, .25u);
arc(C, B, A, .18u);

label.bot(btex $A$ etex, A);
label.bot(btex $B$ etex, B);
label.urt(btex $C$ etex, C);
label.urt(btex $\alpha$ etex, A + (.13u, 0));
label.ulft(btex $\beta$ etex, B + (-.05u, 0));

endfig;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

beginfig(2);

u := 4 cm;

pair A, B, C, S;
A = (0, 0);
B = (u, 0);
S = .5[A,B];
C-S = (B-S) rotated 50;
draw A--B--C--A;
draw halfcircle scaled length(A-B) shifted S;
arc(B, A, C, .25u);
arc(C, B, A, .18u);
pickup pencircle scaled 1pt;
draw A--S--B; draw S--C;

label.bot(btex $A$ etex, A);
label.bot(btex $B$ etex, B);
label.bot(btex $S$ etex, S);
label.urt(btex $C$ etex, C);
label.urt(btex $\alpha$ etex, A + (.13u, 0));
label.ulft(btex $\beta$ etex, B + (-.05u, 0));

endfig;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

beginfig(3);

u := 3 cm;

pair A, B, C, D, S;
path k;

A = (0, 0);
B = (u, 0);
C = (.8u, .8u);
S = circumcenter(A, B, C);
k = fullcircle scaled 2length(S-A) shifted S;
D = point 2.4 of k;
draw A--B--C--D--A--S--C;

label.llft(btex $A$ etex, A);
label.lrt(btex $B$ etex, B);
label.bot(btex $S$ etex, S + (-.02u, -.02u));
label.urt(btex $C$ etex, C);
label.ulft(btex $D$ etex, D);

arc(C, B, A, .2u);
label.ulft(btex $\beta$ etex, B + (-.05u, 0));
arc(A, D, C, .17u);
label.lrt(btex $\delta$ etex, D + (0, -.02u));
arc(A, S, C, .2u);
label.rt(btex $2\delta$ etex, S + (.015u, -.0u));
arc(C, S, A, .17u);
label.ulft(btex $2\beta$ etex, S + (.04u, -.02u));

endfig;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

beginfig(4);

u := 3.5 cm;

pair A, B, C, D, R, Q, O;

B = (0, 0);
C = (u, 0);
A = (.8u, .8u);

D = .53[B, C];
O = (xpart D, .1u);
Q = whatever[A, C];
Q-O = whatever * ((A-C) rotated 90);
R = whatever[A, B];
R-O = whatever * ((A-B) rotated 90);

draw A--B--C--A; draw B--O--Q; draw R--O--C; draw (3[D, O])--(2[O, D]) dashed evenly;
draw A--O dashed evenly;

Ruhol(R, angle(B-R), .1u);
Ruhol(Q, angle(O-Q), .1u);

label.llft(btex $B$ etex, B);
label.lrt(btex $C$ etex, C);
label.llft(btex $D$ etex, D);
label.top(btex $A$ etex, A);
label.ulft(btex $O$ etex, O);
label.ulft(btex $R$ etex, R);
label.rt(btex $Q$ etex, Q);


endfig;



end.
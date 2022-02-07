%Base Matrix
B1 = [0 1 0 0; 0 1 1 0;1 1 1 1];
%Tranformation Matrices
A = [cos(pi/2) sin(pi/2) 0; -sin(pi/2) cos(pi/2) 0;0 0 1];
B = [cos(pi/8) sin(pi/8) 0; -sin(pi/8) cos(pi/8) 0;0 0 1];
D = [cos(pi/6) sin(pi/6) 0; -sin(pi/6) cos(pi/6) 0;0 0 1];
R = [cos(pi/4) sin(pi/4) 0; -sin(pi/4) cos(pi/4) 0;0 0 1];
v_flip =[-1 0 0;0 1 0;0 0 1];
h_flip = [1 0 0; 0 -1 0;0 0 1];
S = [1 0 0; 0 1 -1; 0 0 1];
T = [1 0 -1; 0 1 0; 0 0 1];
U = [1 0 0; 0 1 0.5; 0 0 1];
V = [1 0 1; 0 1 0; 0 0 1];
W = [1 0 6; 0 1 0; 0 0 1];
brown = [222/255 184/255 135/255];
ttbrown = [139/255 69/255 19/255];
tgreen = [0 102/255 0];

axis([-3,13,-3,13])
%Tree
Tr0 = 5*R*B1;
patch(Tr0(1,1:3),Tr0(2,1:3),tgreen)
Tr1 = 5*U*R*B1;
patch(Tr1(1,1:3),Tr1(2,1:3),tgreen)
Tr2 = 5*U*U*R*B1;
patch(Tr2(1,1:3),Tr2(2,1:3),tgreen)
Tr3 = 5*U*U*U*R*B1;
patch(Tr3(1,1:3),Tr3(2,1:3),tgreen)
%Trunk
Trk0 =V*V*V*S*B1;
patch(Trk0(1,1:3),Trk0(2,1:3),ttbrown)
Trk1 = V*V*V*V*A*A*B1;
patch(Trk1(1,1:3),Trk1(2,1:3),ttbrown)
Trk2 = V*V*V*S*A*B1;
patch(Trk2(1,1:3),Trk2(2,1:3),ttbrown)
Trk3 = V*V*V*S*h_flip*B1;
patch(Trk3(1,1:3),Trk3(2,1:3),ttbrown)

%Package 1
%Strings
C11 = T*B*B1;
C12 = T*D*B1;
C21 = T*v_flip*B*B1;
C22 = T*v_flip*D*B1;
%Package
P0 = T*S*B1;
P1 = T*V*A*A*B1;
P2 = T*v_flip*S*B1;
P3 = T*v_flip*V*A*A*B1;
P4 = T*S*A*B1;
P5 = T*S*A*A*v_flip*B1;
P6 = T*S*A*h_flip*B1;
P7 = T*S*A*A*B1;
%Graphing:

hold on
%Present
patch(P0(1,1:3),P0(2,1:3),brown)
patch(P1(1,1:3),P1(2,1:3),brown)
patch(P2(1,1:3),P2(2,1:3),brown)
patch(P3(1,1:3),P3(2,1:3),brown)
patch(P4(1,1:3),P4(2,1:3),brown)
patch(P5(1,1:3),P5(2,1:3),brown)
patch(P6(1,1:3),P6(2,1:3),brown)
patch(P7(1,1:3),P7(2,1:3),brown)

%String
plot(C11(1,1:4),C11(2,1:4),'r')
plot(C12(1,1:4),C12(2,1:4),'r')
plot(C21(1,1:4),C21(2,1:4),'r')
plot(C22(1,1:4),C22(2,1:4),'r')

%Strings
D11 = V*V*V*V*V*V*V*V*V*B*B1;
D12 = V*V*V*V*V*V*V*V*V*D*B1;
D21 = V*V*V*V*V*V*V*V*V*v_flip*B*B1;
D22 = V*V*V*V*V*V*V*V*V*v_flip*D*B1;

plot(D11(1,1:4),D11(2,1:4),'b')
plot(D12(1,1:4),D12(2,1:4),'b')
plot(D21(1,1:4),D21(2,1:4),'b')
plot(D22(1,1:4),D22(2,1:4),'b')

%Package
Q0 = V*V*V*V*V*V*V*V*V*S*B1;
Q1 = V*V*V*V*V*V*V*V*V*V*A*A*B1;
Q2 = V*V*V*V*V*V*V*V*V*v_flip*S*B1;
Q3 = V*V*V*V*V*V*V*V*V*v_flip*V*A*A*B1;
Q4 = V*V*V*V*V*V*V*V*V*S*A*B1;
Q5 = V*V*V*V*V*V*V*V*V*S*S*h_flip*S*B1;
Q6 = V*V*V*V*V*V*V*V*V*S*A*h_flip*B1;
Q7 = V*V*V*V*V*V*V*V*V*S*A*A*B1;
Q8 = V*V*V*V*V*V*V*V*V*V*S*B1;
Q9 = V*V*V*V*V*V*V*V*V*V*V*A*A*B1;
Q10 = V*V*V*V*V*V*V*V*V*V*S*A*B1;
Q11 = V*V*V*V*V*V*V*V*V*V*S*S*h_flip*S*B1;
Q12 = V*V*V*V*V*V*V*V*V*T*v_flip*S*B1;
Q13 = V*V*V*V*V*V*V*V*V*T*v_flip*V*A*A*B1;
Q14 = V*V*V*V*V*V*V*V*V*T*S*A*h_flip*B1;
Q15 = V*V*V*V*V*V*V*V*V*T*S*A*A*B1;

patch(Q0(1,1:3),Q0(2,1:3),brown)
patch(Q1(1,1:3),Q1(2,1:3),brown)
patch(Q2(1,1:3),Q2(2,1:3),brown)
patch(Q3(1,1:3),Q3(2,1:3),brown)
patch(Q4(1,1:3),Q4(2,1:3),brown)
patch(Q5(1,1:3),Q5(2,1:3),brown)
patch(Q6(1,1:3),Q6(2,1:3),brown)
patch(Q7(1,1:3),Q7(2,1:3),brown)
patch(Q8(1,1:3),Q8(2,1:3),brown)
patch(Q9(1,1:3),Q9(2,1:3),brown)
patch(Q10(1,1:3),Q10(2,1:3),brown)
patch(Q11(1,1:3),Q11(2,1:3),brown)
patch(Q12(1,1:3),Q12(2,1:3),brown)
patch(Q13(1,1:3),Q13(2,1:3),brown)
patch(Q14(1,1:3),Q14(2,1:3),brown)
patch(Q15(1,1:3),Q15(2,1:3),brown)
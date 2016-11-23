clc;
clear all;
n=7;k=4;
p=[1 1 0 ; 0 1 1; 1 1 1 ; 1 0 1]; % Parity Matix
d=input('The msg word : ');
%d=[1 0 0 1]; % Message word
ik=eye(k);
g=cat(2,p,ik);
disp('Generator Matrix:');disp(g);
%g1=cyclpoly(n,k) %unneccesary
%gp=poly2sym(g1);
disp('Message Word:');disp(d);
c1=mtimes(d,g);
c=mod(c1,2);
gp=poly2sym(c);
disp('Generator Polynomial:');disp(gp);
disp('The codeword is:');
disp(c);

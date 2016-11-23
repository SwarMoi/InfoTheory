clc;
clear all;
n=7;
k=4;
p=[1 1 0 ; 1 1 1; 0 0 1 ; 1 0 1]; % Parity Matix
d=[1 1 0 1]; % Message word
ik=eye(k);
g=cat(2,ik,p);disp('Generator Matrix:');disp(g);
g1=cyclpoly(n,k,'max');
gp=poly2sym(g1);
disp('Generator Polynomial:');disp(gp);
c1=mtimes(d,g);
c=mod(c1,2);
disp('The codeword for given message is:'); disp(c);

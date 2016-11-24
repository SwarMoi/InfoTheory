clear all
syms x
a1=input('Enter msg in bit : '); %input in bit
g1=x^3+x+1;                      %generator poly
g=sym2poly(g1);                  %convert in bit
z=conv(a1,g);                    %convolution
c=mod(z,2);                      %modular 2 addition
disp(c);

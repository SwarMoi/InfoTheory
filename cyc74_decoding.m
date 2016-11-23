%Decoding
clc;
clear all;
p=[1 1 0 ; 0 1 1; 1 1 1 ; 1 0 1]; % Parity Matix
r=input('Input Code word To be Decoded : ');
disp('received word of 7 bit:');disp(r);
n=7;k=4;
ink=eye(n-k);
h=cat(2,ink,p');
ht=h';
%disp('Transpose of parity check matrics :');disp(ht);

s0=r*ht;
s=mod(s0,2);
disp('Syndrome :');disp(s);

%
g1=cyclpoly(n,k,'max');
gp=poly2sym(g1);
rp=poly2sym(r);
[qp,remp]=quorem(rp,gp);
%
%disp('Syndrome polynomial:');disp(qp);
%rem=sym2poly(remp);

if (s == 0)
disp('The received code is CoRRecT.');
else
disp('The received code is INCoRRecT.');
row = 0;
for j=1:1:n 
m=xor(s,ht(j,:));
if (m==0)
row = j;
break;
end
end
 r(1,row) = ~r(1,row) ;      %To replace with correct position of 1
% disp(r);
disp('Correct codeword is:');
end
disp(r);

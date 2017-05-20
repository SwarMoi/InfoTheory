m =input('The msg word m : '); n = 2^m-1; % Codeword length
k = input ('The msg length : ') ; % Message length
nwords = input('No. of words to encode : ');% Number of words to encode 
msg = gf(randi([0 1],nwords,k));
disp(msg)
% Find t, the error-correction capability.
[genpoly,t] = bchgenpoly(n,k);
disp('Generator Polynomial : ')
disp(genpoly)
disp('No of errors')
disp(t)
% Define t2, the number of errors to add in this example.
t2 = t;

% Encode the message.
code = bchenc(msg,n,k);
disp('Encoded msg : ')
disp(code)
% Corrupt up to t2 bits in each codeword.
noisycode = code + randerr(nwords,n,1:t2);
disp('Code + Noise : ')
disp(noisycode)
% Decode the noisy code.
[newmsg,err,ccode] = bchdec(noisycode,n,k);

if ccode==code
   disp('All errors were corrected.')
end
if newmsg==msg
   disp('The message was recovered perfectly.')
end

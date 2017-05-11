m = 4; n = 2^m-1; % Codeword length
k = 5; % Message length
nwords = 10; % Number of words to encode
msg = gf(randi([0 1],nwords,k));
% Find t, the error-correction capability.
[genpoly,t] = bchgenpoly(n,k);
% Define t2, the number of errors to add in this example.
t2 = t;

% Encode the message.
code = bchenc(msg,n,k);
% Corrupt up to t2 bits in each codeword.
noisycode = code + randerr(nwords,n,1:t2);
% Decode the noisy code.
[newmsg,err,ccode] = bchdec(noisycode,n,k);
if ccode==code
   disp('All errors were corrected.')
end
if newmsg==msg
   disp('The message was recovered perfectly.')
end

function histo=des_pat18(sinyal)
% sinyal=rand(1,5452);
h1=zeros(1,256);
h2=zeros(1,256);
sbox=[14 11 2 12 4 7 13 1 5 0 15 10 3 9 8 6];
sbox=sbox+1;
for i=1:length(sinyal)-15
    b=sinyal(i:i+15);
    for j=1:16
        bit(j)=(b(j)>=b(sbox(j)));
    end
    right(i)=0; left(i)=0;
    for j=1:8
        right(i)=right(i)+bit(j)*2^(8-j);
        left(i)=left(i)+bit(8+j)*2^(8-j);
    end
    h1(right(i)+1)=h1(right(i)+1)+1;
    h2(left(i)+1)=h2(left(i)+1)+1;
end
histo=[h1 h2];
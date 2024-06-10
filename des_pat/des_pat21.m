function histo=des_pat21(sinyal)
% sinyal=rand(1,5452);
h1=zeros(1,256);
h2=zeros(1,256);
sbox=[12 1 10 15 9 2 6 8 0 13 3 4 14 7 5 11];
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
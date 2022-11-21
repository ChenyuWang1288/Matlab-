function[b]=Huffman_de(a)
[m,n]=size(a);
i1=a(:);
p=zeros(1,256);
for i=0:255
    p(i+1)=length(find(i1==i))/(m*n);
end
k=0:255;
dict=huffmandict(k,p);
enco=huffmanenco(i1,dict);
deco=huffmandeco(enco,dict);
ide=col2im(deco,[m,n],[m,n],'distinct');
b=uint8(ide);
end

function [result] = Huffman(image)
[m, n] = size(image);
vector = image(:);
p = zeros(1, 256);
for i = 1:256
    p(i) = length(find(vector == (i-1))) / (m*n);
end
k = 0:255;
dict = huffmandict(k, p);
enco = huffmanenco(vector, dict);
result = enco;
end

function[w] = Haar(a)
p = double(a);
h = zeros(256,256);
for j = 1:256
    h(1,j) = 1 / 256;
end
for n=1:8
    for i=2^(n-1) + 1:2^n
        for j=2^(9-n) * (i-2^(n-1)) - 2^(9-n) + 1:2^(9-n)*(i-2^(n-1))-2^(8-n)
            h(i,j) = 2^(n-9);
        end
        for j=2^(9-n) * (i-2^(n-1)) - 2^(8-n) + 1:2^(9-n) * (i-2^(n-1))
            h(i,j) = -2^(n-9);
        end
    end
end

r1 = (h * (p.')).';
c1 = h * r1;
res = c1;
for i = 2:256
    if res(i) < 5 && res(i) > -5
        res(i) = 0;
    end
end     
g = h.';
for i = 1:256*256
    if g(i) > 0 
        g(i) = 1;
    elseif g(i) < 0 
        g(i) = -1;
    end
end
nc1 = g*res;
nr1 = (g*(nc1.')).';
w = uint8(nr1);
end

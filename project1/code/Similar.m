function [result] = Similar(compare1,compare2)
result = 0;
for i = 1:9
    result = result + compare1(i)*compare2(i);
end
tmp = 0;
for i = 1:9
    tmp = tmp + compare1(i)*compare1(i);
end
result = result / sqrt(tmp);
tmp = 0;
for i = 1:9
    tmp = tmp + compare2(i)*compare2(i);
end
result = result / sqrt(tmp);
end


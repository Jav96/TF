a = ones(1,10);
for i = 1:length(a)
    a(i) = a(i)*rand-0.5;
    if a(i) < 0
        a(i) = 0;
    end
end
        

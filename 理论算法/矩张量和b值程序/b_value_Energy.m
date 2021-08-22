function [b]=b_value_Energy(m,E,N)
sum_E = 0;
sum_E2=0;
sum_N=0;
sum_muti_EN=0;
sum_dot_EN=0;
sum_muti_ENm=0;
sum_E22=0;
sum_E2m=0;

for n=1:m    
    if(N(n)==0)
        N(n)=1;
    end
end

for n=1:m
    
    sum_E = sum_E+log10(E(n));
    sum_E2 = sum_E2+log10(E(n))*log10(E(n));
    sum_N = sum_N+log10(N(n));
    
    sum_muti_EN = sum_muti_EN+log10(E(n))*log10(N(n));
    
end
sum_dot_EN = sum_E*sum_N;
sum_muti_ENm = m*sum_muti_EN;
sum_E22 = sum_E2*sum_E2;
sum_E2m = m*sum_E2;

b = (sum_dot_EN-sum_muti_ENm)/(sum_E2m-sum_E22);


end
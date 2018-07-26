function genmonosigma

n=(0:1e13:200e14);
T=70;

kB=1.38064852e-23;
hbar=1.054571800e-34;   
vf=1.1e6; 

EF=hbar.*vf.*sqrt(pi.*n);
TF=EF./kB;
mu=Fmu(T./TF).*EF; 
mutilde=mu./(kB.*T);

sigmamono=zeros(1,length(n));

for j=1:length(mutilde)
    sigmamono(j)= monocond(mutilde(j));
end

n=n./1e14;

save(['monolayersigmas_T' num2str(T) 'K.mat'],'sigmamono','T','n','mutilde');
% units
% sigmamono in units of e^2/hbar
% T in units of K
% n in units of 10^10 cm^-2.
% mutilde in dimensionless units

end


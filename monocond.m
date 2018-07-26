function output = monocond(mutilde)
% outputs conductivity in units of e^2/hbar.

% tic
dimp=0;
nimp=5e14;

intgrnd=@(Etilde) abs(Etilde) .* 1./ (cosh(0.5.*(Etilde-mutilde))).^2; % 1 is where the scattering time used to be.

output=1./(4.*pi).*integral(intgrnd,-Inf,Inf,'AbsTol',1e-4,'RelTol',1e-4,'ArrayValued',true);
% toc

end


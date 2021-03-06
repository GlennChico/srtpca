% adfig11 -- Adapt Figure 11: Simulate the SURE threshold estimation procedure
%
% (Panel a) A 128-long vector, where only the first 16 
% entries are nonzero, contaminated with Normal(0,1) noise.
% (Panel b) Reconstruction with soft thresholding chosen
% by minimizing the SURE criterion.  
% (Panel c) The SURE criterion for soft thresholding, as a
% function of the threshold. (Panel d) The actual loss of the 
% thresholding rule, as a function of thethreshold.

%
%   1. Create a normal vector with sparse means
%
	theta = zeros(1,128);
	theta(1:16) = 4 .* ones(1,16);
	rand('seed',0);
	x = theta + WhiteNoise(theta);
	clf;
	n = 128;
%
%   2. Calculate the SURE curve
%
	a = sort(abs(x)).^2 ;
	b = cumsum(a);
	n = length(x);
	c = linspace(n-1,0,n);
	s = b+c.*a;
	risk = (n - ( 2 .* (1:n ))  + s)/n;
	[guess,ibest] = min(risk);
	lambda = sqrt( a(ibest) );
	res = (abs(x) - lambda);
	res = (res + abs(res))/2;
	xhat = sign(x).*res;
%
%   3. Calculate the Loss curve
%
	loss = zeros(size(x));
	lam = sqrt(a);
	for i=1:128
		loss(i) = sum( (SoftThresh(x,lam(i)) - theta).^2 ) ./ 128;
	end
%
%   4. Display
%
	versaplot(221,1:n, x   ,[],'11(a) raw data',[0 128 -4 6],[])
	versaplot(222,1:n, xhat,[],'11(b) estimate',[0 128 -4 6],[])
	ax = [ 0 max(sqrt(a)) 0 max(risk) ];
	versaplot(223,lam, risk,[],'11(c) estimated risk versus lambda',ax,[])
	versaplot(224,sqrt(a), loss,[],'11(d) loss versus lambda',ax,[])

    
    
%   
% Part of WaveLab Version 802
% Built Sunday, October 3, 1999 8:52:27 AM
% This is Copyrighted Material
% For Copying permissions see COPYING.m
% Comments? e-mail wavelab@stat.stanford.edu
%   
    

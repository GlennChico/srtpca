% adfig02 -- Adapt Figure 02: Noisy Versions of Four Signals
%
% The four objects of Figure 1 with white noise superposed.
% The noise is normally distributed with variance 1.
%
% 

global N L t 
global yblocks ybumps yheavi yDoppler
%
clf;
versaplot(221,t,yblocks, [],' 2 (a) Noisy Blocks '   ,[],[])
versaplot(222,t,ybumps,  [],' 2 (b) Noisy Bumps '    ,[],[])
versaplot(223,t,yheavi,  [],' 2 (c) Noisy HeaviSine ',[],[])
versaplot(224,t,yDoppler,[],' 2 (d) Noisy Doppler '  ,[],[])

    
    
%   
% Part of WaveLab Version 802
% Built Sunday, October 3, 1999 8:52:27 AM
% This is Copyrighted Material
% For Copying permissions see COPYING.m
% Comments? e-mail wavelab@stat.stanford.edu
%   
    

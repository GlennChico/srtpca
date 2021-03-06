function PlotWaveCoeffLocal(wavecoef,L,scal)
% IMJPlotWaveCoeff -- Wavelet Coeffts Plot: IMJ version with 
% changed axis labelling 
[n,J] = dyadlength(wavecoef); 
if scal==0, 
   seg = (1+ 2^(L)):(n);
   scal = .75 ./ max(abs(wavecoef(seg))); 
end
LockAxes([0 1  (L-1) J]); 
for j=(J-1):(-1):L
  tj = (.5:(2^(j)-.5))./2^(j) ;
  PlotSpikes(j,tj,(wavecoef(dyad(j)).*scal));
end
%xlabel('k, spatial position'); ylabel('j, resolution scale');
%title('Wavelet Decomposition');
UnlockAxes;

    
    
%   
% Part of WaveLab Version 802
% Built Sunday, October 3, 1999 8:52:27 AM
% This is Copyrighted Material
% For Copying permissions see COPYING.m
% Comments? e-mail wavelab@stat.stanford.edu
%   
    

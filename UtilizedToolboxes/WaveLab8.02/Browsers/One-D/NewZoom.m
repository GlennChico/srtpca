function NewZoom
% NewZoom -- Called by WLBrowser
%  Usage
%    NewZoom
%
global PlotFig signal_name
tmp = get(PlotFig,'UserData');
s = length(tmp);
u = tmp(4:s);
[x,y] = ginput(2);
r = floor(x(1)):ceil(x(2));
figure
plot(r, u(r));
grid
title(['Zoom in on : ' signal_name]);
    
    
%   
% Part of WaveLab Version 802
% Built Sunday, October 3, 1999 8:52:27 AM
% This is Copyrighted Material
% For Copying permissions see COPYING.m
% Comments? e-mail wavelab@stat.stanford.edu
%   
    

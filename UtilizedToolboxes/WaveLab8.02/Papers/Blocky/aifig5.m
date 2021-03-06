% aifig5 -- Show Boundary Wavelets
%
% This figure displays some boundary wavelets and
% corresponding wavelets at the interior of the 
% interval.  The wavelets at the ``heart'' of the 
% interval are the same as the non-boundary adjusted 
% wavelets.  The wavelets at the ``ends'' are modified
% to maintain polynomial exactness and related 
% properties.
%
global Fil2 Fil4 Fil6 Fil8
global EdgeFil2 EdgeFil4 EdgeFil6 EdgeFil8
%
%  D=2 Boundary Wavelets
%
   clf; 
   subplot(221); 
   LockAxes([0 1 -20 20]);
   for j= [1 2  5 7 8],
    a = zeros(1,8); 
    a(j) = 1; 
    for k=1:5, 
      a = AIRefine(a,2,Fil2,EdgeFil2); 
    end;
    t = (0:255) ./256; 
    if j==1, pch = '-.'; end
    if j==2, pch = '--'; end
    if j==5, pch = '-'; end
    if j==7, pch ='--'; end
    if j==8, pch = '-.'; end
    plot(t,8 .*a, pch); 
   end
   title('5(a) Interval Wavelets phi_{3,k}, D=2'); 
   UnlockAxes;
%
%  D=4
%
subplot(222); 
LockAxes([0 1 -20 20]);
for j= [1 2  9 15 16],
a = zeros(1,16); 
a(j) = 1; 
for k=1:5, 
  a = AIRefine(a,4,Fil4,EdgeFil4); 
end;
t4 = (0:(length(a)-1)) ./length(a); 
if j==1, pch = '-.'; end
if j==2, pch = '--'; end
if j==9, pch = '-'; end
if j==15, pch ='--'; end
if j==16, pch = '-.'; end
plot(t4,8 .*a, pch); 
end
title('5 (b) Interval Wavelets phi_{4,k}, D=4');
UnlockAxes;
%
%  D=6
%
subplot(223); 
LockAxes([0 1 -20 20]); 
for j= [1 2  5 7 8],
a = zeros(1,16); 
a(2*j) = 1; a(2*j-1) = -1; 
for k=1:4, 
  a = AIRefine(a,2,Fil2,EdgeFil2); 
end;
t = (0:255) ./256; 
if j==1, pch = '-.'; end
if j==2, pch = '--'; end
if j==5, pch = '-'; end
if j==7, pch ='--'; end
if j==8, pch = '-.'; end
plot(t,8 .*a, pch); 
end
title('5 (c) Interval Wavelets psi_{3,k}, D=2');
UnlockAxes;
%
%  D=8
%
subplot(224); 
LockAxes([0 1 -20 20]); 
for j= [1 2  9 15 16],
a = zeros(1,32); 
a(2*j) = 1; a(2*j-1) = -1; 
for k=1:4, 
  a = AIRefine(a,4,Fil4,EdgeFil4); 
end;
if j==1, pch = '-.'; end
if j==2, pch = '--'; end
if j==9, pch = '-'; end
if j==15, pch ='--'; end
if j==16, pch = '-.'; end
plot(t4,8 .*a, pch); 
end
title('5 (d) Interval Wavelets psi_{4,k}, D=4');
UnlockAxes
    
    
%   
% Part of WaveLab Version 802
% Built Sunday, October 3, 1999 8:52:27 AM
% This is Copyrighted Material
% For Copying permissions see COPYING.m
% Comments? e-mail wavelab@stat.stanford.edu
%   
    

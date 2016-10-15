function [ ysub, ybase ] = AlgoSub( x, y, max_height, max_iter )
% Algorithmic subtraction of high peaks in NMR spectra
%
% Dec 29, 2005
%
% written by Jae-Seung Lee and A. K. Khitrin
%
% Jul 8, 2015
% made as a function by Jae-Seung Lee

% x: frequency offsets
% y: spectral intensities
% max_height: the maximum height of the subtraceted spectrum
% max_iter: maximum number of iteration

x=x(:);
y=y(:);

N=length(x);

M2=y-max_height;
M3=y;

% The variables a and b determines the weights of the lengths of a path
% and its first derivative in calculation
a=0.5;
b=1-a;

% This constant determines the speed to approach the solution.
% The iteration may not converge if the value is larger than some critical value.
c=0.3;

% Cut off the first and last ten data points.

h = waitbar(0, 'Please wait...');

for m=1:max_iter
    
    dM = ( - b * ( circshift(M3,2) + circshift(M3,-2) ) ...
        + (1 + 3*b) * ( circshift(M3,1) + circshift(M3,-1) ) ) / ( 2 + 4 * b) ...
        - M3;
    
    M3 = M3 + c*dM;
    
    waitbar(m/max_iter)
    
    % The updated path should be between the original and shifted spectra.
    ind = find( M3 > y );
    M3(ind) = y(ind);
    ind = find( M3 < M2 );
    M3(ind) = M2(ind);
    
end

delete(h)

ybase = M3;
ysub = y - ybase;

plot(x,y,x,M2,x,ybase,x,ysub)
ylim([-1.1 1.1]*max_height)
legend('original','shifted','base','subtracted')

end


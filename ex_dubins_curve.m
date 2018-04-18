function ex_path = ex_dubins_curve(p1, p2, r, stepsize, quiet)

ex_length = 500; 

if nargin < 3
    error('Function requires at least two inputs.');
elseif nargin < 4
    stepsize = 0;
elseif nargin < 5
    quiet = 0;  %Default/undefined is not quiet
end
    
path = dubins_curve(p1,p2, r, stepsize, 1);

ex_path = zeros(ex_length,3);
step_size = path(end,1) - path(end-1,1);

for i = 1:ex_length;
    ex_path(i,1) = path(end,1) + i*step_size*cos(path(end,3));
    ex_path(i,2) = path(end,2) + i*step_size*sin(path(end,3));
    ex_path(i,3) = path(end,3);
end

ex_path = [path;ex_path];

plot(ex_path(:,1), ex_path(:,2),'x');hold on;
scatter(path(1,1), path(1,2), 45, '*','r','LineWidth',1); 
scatter(path(end,1), path(end,2), 45, 'square','b','LineWidth',1); 
text(path(1,1), path(1,2),'start','HorizontalAlignment','center');
text(path(end,1), path(end,2),'end','VerticalAlignment','top');
hold off

%axis 'auto y'
%axis 'auto x'


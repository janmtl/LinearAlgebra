%% EE241 Spring 2015, Tutorial 6, Feb. 27
% In this tutorial we'll cover some of the basic use cases for MATLAB(R) in
% linear algebra as well some basic troubleshooting.
%
% Off the bat, note that USC provides MATLAB for free to its students at
% http://software.usc.edu. However! USC provides the 2013b release. If
% you're running Mac OS X Yosemite (10.10), you should go to the mathworks
% website (http://www.mathworks.com) and create a Mathworks account, then 
% download MATLAB 2014b which runs on the newer version of Java.
% "Activating" MATLAB during the installation process can be harrowing. I
% find it easiest to just use your mathworks account. The same key USC
% gives you for their download of 2013b should work for 2014b as well.

%% The MATLAB UI
% If you're reading this as a webpage: cool! If you want to try out the
% commands inside this document download the tutorial file from blackboard.
% If you open this file in MATLAB it will appear in an "Editor" window.
% This is a window for writing and editing MATLAB scripts. In the default
% MATLAB setup there should be a file browser on the left ("Current
% Folder") and a variable browser on the right ("Workspace"). There should
% also be a Command Window at the bottom. The command window is where you
% can execute individual commands interactively, or call on scripts. It's
% also where the output of any line without a semi-colon (;) shows up. You
% can reorganize your workspace to accomodate what you're working on.
%
% Let's start by calling clear; to clear all variables from memory, and
% clc; to clear the command window of text. Note that any number of MATLAB
% commands can fit on the same line if they are each followed by a
% semi-colon.
clear; clc;



%% Matrices: first-class citizens in the world of MATLAB
% You can write a row vector by using commas
u = [1,2,3,4]
%%
% You can write a column vector by using colons
v = [1;2;3;4]
%%
% You can write a matrix by using a combination of both
A = [1,2;3,4]
%%
% A colon between two numbers (hard-coded or variable) gives a range
% between those numbers
2:5
%%
% A set of three numbers seperate by colons gives a range with a step,
% i.e.:
0.1:0.2:0.95
%%
% Note that the result only goes to 0.9 and doesn't include 0.95. We can
% also measure the size of matrices using the following two functions
size(A)
numel(A)
%%
% 'size(A)' gives you a vector of dimensions (in our case matrices have 2
% dimensions), 'numel(A)' gives you the number of elements contained inside
% A. This second one is useful if you want to know roughly how much space
% your matrix takes up in memory.
clear; clc;



%% Extracting values
% To extract the elements of a matrix, use parentheses
A = [1,2;3,4];
A(1,2)
%%
% The arguments are always A(row,column) However! 'row' and 'column' can be
% vectors too! Consider first, the following matrix
B = [1,2,3,4;5,6,7,8;9,0,1,2;3,4,5,6]
%%
% We can extract the last three entries of the second row by calling
B(2,2:4)
%%
% We can even skip the third column by using a step
B(2,2:2:4)
%%
% We can do this for all rows at once by using a range without arguments
B(:,2:2:4)
%%
% By default ranges are 0:1:end and any argument we leave out is assumed to
% take those values
B(:,2)
%%
% Notice the following behavior for two ranges
B(1:2:4,1:2:4)
%%
% A powerful trick for augmenting a matrix
A = [1,2,3;4,5,6;7,8,9];
b = [1;1;1];
[A,b]
[A b]
%%
clear; clc;



%% Basic linear algebra with MATLAB
% You can multiply matching dimension
[1,2,3]*[1;2;3]
[1;2;3]*[1,2,3]
%%
% You can easily take transposes of vectors or matrices with an apostrophe
[1,2,3]'
[1,2;3,4]'
%%
% Solving a linear system is, however, very easy
A = [1,2,3,4;5,6,7,8;9,0,1,2;3,4,5,0]
b = [1;2;3;4]
x = A\b
%%
% If you want to see it as fractions, try
format rat
x
format short
%%
% Notice that inv(A) gets us the same result
C = inv(A)
C*b
%%
clear; clc;



%% Singular matrices
% What happens when we consider linear systems without single solutions?
% First, let's try a square matrix that has some free variables in rref
A = [1,2,3;4,5,6;5,7,9]
rref(A)
%%
% Note the introduction of the rref(A) function above. It works exactly
% like you'd expect it to. Next let's choose a 'b'. To ensure Ax=b has a
% solution, we'll just choose 'x' first
x = [1;2;3];
b = A*x
%%
% Now let's go back and solve for 'x'
x1 = A\b
x2 = inv(A)*b
%%
% Looks like the two inversion methods gave us two different solutions! You
% should always check your solutions
A*x2
%%
% And so we discard the inv(A) result.
clear; clc;



%% Wide (under-constrainted) and tall (over-constrainted) systems
% How does MATLAB handle non-square matrices? Let's consider a wide matrix
% (under-constrained problem) first
A = [1,2,3,4;5,6,7,8;1,0,1,0];
b = A*[1;0;1;0];
x = A\b
%%
% Works fine! But the general solution obviously has some free variables in
% it. Nullspace will be covered later in the course but if you're curious
% about how to generate the other solutions just call
x + null(A)
%%
% A tall matrix (over-constrained system) is
A = [1,0,2;0,1,3;-1,1,1;1,1,5]
b = [0;0;0;1]
x = A\b
%%
% The warning generated by MATLAB should clue us into the fact that there
% is no solution. We can just check that
A*x
%%
clear; clc;



%% Special matrices
% The identity matrix (and its cousins)
eye(2)
eye(2,3)
eye(3,2)
%%
% The all-zeros matrix
zeros(2)
zeros(2,3)
zeros(3,2)
%%
% The all-ones matrix
ones(2)
ones(2,3)
ones(3,2)
%%
% A matrix of uniformly distributed random numbers
rand(3)
%%
% A matrix of uniformly distributed random integers from 0 to 5
A = randi(5,3)
%%
% The upper-triangular portion of A
triu(A)
%%
% The upper-triangular portion of A *without* the diagonal entries
triu(A,1)
%%
% The lower-triangular part
tril(A)
%%
% The diagonal part of A
diag(A)
%%
% A diagonal matrix formed from a vector
d = [1,2,3];
diag(d)
%%
clear; clc;



%% Benchmarking
% So what's the difference between inv(A)*b and A\b? Consider:
n = 10000; 
Q = orth(randn(n,n));  % These four steps are
d = logspace(0,-10,n); % designed only to cause
A = Q*diag(d)*Q';      % trouble for MATLAB so
x = randn(n,1);        % that it can't take shortcuts
b = A*x;
%%
% Now solve the system with inv(A)*b
tic, y = inv(A)*b; toc
err = norm(y-x)
res = norm(A*y-b)
%%
% Compared to with A\b:
tic, z = A\b; toc
err = norm(z-x)
res = norm(A*z-b)
%%
clear; clc;



%% Numerical precision
% What's the value of 2^53 + 1 - 2^53? If you said '1', MATLAB disagrees
2^53 + 1 - 2^53
%%
% Now, what's the value of 2^53 - 2^53 + 1?
2^53 - 2^53 + 1
%%
% MATLAB calculates the first operator before the second and, in between,
% incurs some errors because 2^53 is too large. Similarily
1 - 3*(4/3 - 1)
%%
% Since 4/3 cannot be represented accurately in binary. Sometimes, this
% works against you by producing '0' where there should not be one
sqrt(1e-16 + 1) - 1
%%
% The function eps(x) tells us how much error there can be on a given
% number
eps(0)
eps(1)
eps(pi)
%%
% Let's experiment with eps() and inv()
A = ones(5)
inv(A)
inv(A+eye(5)*eps(0))
%%
clear; clc;



%% Determinants
% MATLAB calculates the determinant using the LU decomposition we covered
% in an earlier tutorial (optional material). Let's see the det() command
% in action
A = [1,2,3,4;5,6,7,8;1,0,1,0;0,1,0,2]
det(A)
%%
% The determinant is a nice way to check if a matrix is invertible
A = [1,2,3,4;5,6,7,8;0,0,0,1;0,0,0,1]
det(A)
%%
% The calculation of the determinant is also susceptible to the same
% numerical imprecision we introduced earlier
rref(A)
det(rref(A)+eye(4)*eps(0))
%%
clear; clc;



%% The MATLAB(R) PATH
% The "Current Folder" window shows you the folder on your computer where
% MATLAB will search for scripts before looking in its own built-in
% libraries. You can display all of the paths MATLAB uses by calling
path;
%%
% the 'path' variable is always present while you're running MATLAB. To add
% a new folder (for example called 'homework4') you can call
path = path(path, '/User/yan/Documents/homework1')
%%
clear; clc;

%% Is the average matrix intertible?
% Let's generate matrices of random numbers in a loop and count how many
% are non-invertible (have determinants of 0)
N = 10000;
n = 5;
counter = 0;
for k=1:N
    A = rand(n);
    if det(A) == 0
        counter = counter + 1;
    end
end
p = counter/N
%%
% However, let's consider, instead, matrices of random *integers*
MAX = 5;
N = 10000;
n = 5;
counter = 0;
for k=1:N
    A = randi(MAX, n);
    if det(A) == 0
        counter = counter + 1;
    end
end
p = counter/N
%%
% We get some non-negligible amount.
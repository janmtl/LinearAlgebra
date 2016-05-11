%% EE241 Spring 2015, Tutorial 11, Apr. 10
% Does a random set of n-dimensional vectors span $\mathbb{R}^n$? Let's
% start with a simple example in $\mathbb{R}^3$. Let $N$ be the number of
% trials we run, $n$ be the number of columns and let's check the rank of
% multiple cases of random matrices that are $3 \times n$.
N     = 500;
m     = 3;
n_max = 8;

ranks = zeros(N, n_max);

for n=1:n_max
  for k=1:500
    A = rand(m,n);
    ranks(k, n) = rank(A);
  end
end

avg_rank = mean(ranks);
std_rank = std(ranks);
errorbar(1:n_max, avg_rank, std_rank);

%%
% As you can see, the rank is equal to the number of columns. This is
% because the probability of choosing another real-valued vector at random
% that is co-linear or co-planar with the first two vectors is 0. Just to
% make sure though, let's check with a larger matrix
N     = 500;
m     = 10;
n_max = 15;

ranks = zeros(N, n_max);

for n=1:n_max
  for k=1:500
    A = rand(m,n);
    ranks(k, n) = rank(A);
  end
end

avg_rank = mean(ranks);
std_rank = std(ranks);
errorbar(1:n_max, avg_rank, std_rank);

%%
% Again, the number of columns predicts _exactly_ the rank of the matrix.
% What we would like to find, is an example where when choosing $n$,
% $n$-dimensional vectors, there is a non-trivial probability of choosing
% them in a linearly dependent way. If we use integer-valued vectors, we
% might observe this effect. We use the 'randi()' function to make column
% vectors with entries uniformly distributed between 1 and 3.
N     = 500;
m     = 10;
n_max = 15;
I_max = 3;

ranks = zeros(N, n_max);

for n=1:n_max
  for k=1:500
    A = randi(I_max, m,n);
    ranks(k, n) = rank(A);
  end
end

avg_rank = mean(ranks);
std_rank = std(ranks);
errorbar(1:n_max, avg_rank, std_rank);

%%
% Finally! we some effect near column number 9 and 10. The intuition is
% that when choosing the very last column of a 10x10 matrix, if choosing
% the entries at random, it's not unlikely that we will choose something
% redundant. Let's see if we can amplify this effect by using a binary
% matrix
N     = 500;
m     = 10;
n_max = 15;

ranks = zeros(N, n_max);

for n=1:n_max
  for k=1:500
    A = randi(2, m,n)-1;
    ranks(k, n) = rank(A);
  end
end

avg_rank = mean(ranks);
std_rank = std(ranks);
errorbar(1:n_max, avg_rank, std_rank);


function g = GenerateEmptyGraph( N )

    if nargin == 0 || ~isscalar(N) || N<1
        N = 0;
    end

    g = Network.Graph();
    g.name = 'Empty Graph';
    g.adjacencyMatrix = sparse(N,N);
    
end
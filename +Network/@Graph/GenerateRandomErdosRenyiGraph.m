function g = GenerateRandomErdosRenyiGraph( N, probability, isDirected )

    if nargin == 0 || ~isscalar(N) || N<1
        error('Invalid graph size given');
    end
    if nargin < 3
        isDirected = false;
    end
    
    % Construct graph
    g = Network.Graph();
    g.name = 'Erdos-Renyi Random Graph';
    g.isDirected = isDirected;
    
    if isDirected
        adjacencyMatrix = rand(N) > (1-probability);
        adjacencyMatrix(1:N+1:N^2) = 0;
        g.adjacencyMatrix = adjacencyMatrix;
    else
        g.adjacencyMatrix = triu(rand(N),1) > (1-probability);
    end
        
end

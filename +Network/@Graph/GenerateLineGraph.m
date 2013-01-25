function g = GenerateLineGraph( N, isDirected )

    if nargin == 0 || ~isscalar(N) || N<1
        error('Invalid graph size given');
    end
    if nargin < 2
        isDirected = false;
    end
    
    % Construct graph
    g = Network.Graph();
    g.name = 'Line Graph';
    g.adjacencyMatrix = sparse(1:N-1, 2:N, true(N-1, 1), N,N);
    g.isDirected = isDirected;
    
    % Setup line layout
    g.xNodeCoordinates = 1:N;
    g.yNodeCoordinates = zeros(1,N);
    
end

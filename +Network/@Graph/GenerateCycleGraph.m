function g = GenerateCycleGraph( N, isDirected )

    if nargin == 0 || ~isscalar(N) || N<1
        error('Invalid graph size given');
    end
    if nargin < 2
        isDirected = false;
    end
    
    % Construct graph
    g = Network.Graph();
    g.name = 'Cycle Graph';
    g.adjacencyMatrix = sparse(1:N, [2:N, 1], true(N, 1), N,N);
    g.isDirected = isDirected;
    
    % Setup cirular layout
    cirularAngles = linspace(0, 2*pi, N+1);
    g.xNodeCoordinates = sin(cirularAngles(1:end-1));
    g.yNodeCoordinates = cos(cirularAngles(1:end-1));
    
end

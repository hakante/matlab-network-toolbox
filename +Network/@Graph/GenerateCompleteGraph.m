function g = GenerateCompleteGraph( N )

    if nargin == 0 || ~isscalar(N) || N<1
        error('Invalid graph size given');
    end
    
    % Construct graph
    g = Network.Graph();
    g.name = 'Complete Graph';
    g.isDirected = false;
    g.adjacencyMatrix = triu(true(N,N),1);
    
    % Setup cirular layout
    cirularAngles = linspace(0, 2*pi, N+1);
    g.xNodeCoordinates = sin(cirularAngles(1:end-1));
    g.yNodeCoordinates = cos(cirularAngles(1:end-1));
    
end



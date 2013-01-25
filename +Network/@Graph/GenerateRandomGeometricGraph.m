% Algorithm: generates some nodes on the [0 1] X [0 1] plane and then connect
% them if they are sufficiently close
function g = GenerateRandomGeometricGraph( N, connectionDistance, ensureConnected )
    g = Network.Graph();
    g.name = 'Random Geometric Graph';
    g.isDirected = false;
    
    if nargin < 3
        ensureConnected = false;
    end
    
    generateGraph(g, N, connectionDistance);
    
    if ensureConnected
        % until the graph is not connected generate an other one
        isConnected = g.IsConnected();
        attemptCounter	= 1;
        while ~isConnected
            attemptCounter = attemptCounter + 1;
            if( attemptCounter > 20 )
                error('communication radius too small to have a connected graph => increase it');
            else
                warning('Network is not connected, attempt %d', attemptCounter);
            end
            generateGraph(g, N, connectionDistance);
            isConnected = g.IsConnected();
        end
    end
end

function generateGraph(g, N, connectionDistance)
    % Generate random coordinates
    g.xNodeCoordinates = rand(1, N);
    g.yNodeCoordinates = rand(1, N);

    % Check euclidean distance
    g.adjacencyMatrix = ...
        (repmat(g.xNodeCoordinates,N,1)-repmat(g.xNodeCoordinates',1,N)).^2 ...
        + ...
        (repmat(g.yNodeCoordinates,N,1)-repmat(g.yNodeCoordinates',1,N)).^2 ...
        + ...
        diag(inf(N,1)) ... % To avoid self-loops
        < connectionDistance^2;
end
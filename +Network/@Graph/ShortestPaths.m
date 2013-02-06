function pathLengths = ShortestPaths( g, startNode, endNode )

    pathLengths = inf( g.numberOfNodes, 1 );
    pathLengths(startNode) = 0;
    
    for i = 1:g.numberOfNodes-1
        for edge = g.adjacencyList'
            % TODO: Replace 1 with edge weight
            if pathLengths(edge(1))+1 < pathLengths(edge(2))
                pathLengths(edge(2)) = pathLengths(edge(1))+1;
            end
            if ~g.isDirected && pathLengths(edge(2))+1 < pathLengths(edge(1))
                pathLengths(edge(1)) = pathLengths(edge(2))+1;
            end
        end
    end
    
    for edge = g.adjacencyList'
        % TODO: Replace 1 with edge weight
        if pathLengths(edge(1))+1 < pathLengths(edge(2))
            warning('Graph contains negative cycles');
            break;
        end
    end
    
    if nargin == 3
        pathLengths = pathLengths(endNode);
    end
    
end


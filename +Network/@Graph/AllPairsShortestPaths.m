function pathLengths = AllPairsShortestPaths( g )

    % Initialization
    pathLengths = inf( g.numberOfNodes );
    % TODO: Enable optional weights, currently # hops
    pathLengths(g.adjacencyMatrix) = 1;
    pathLengths(1:g.numberOfNodes+1:g.numberOfNodes*g.numberOfNodes) = 0;
    
    % Floyd-Warshall algorithm, |N|^3
    for k = 1:g.numberOfNodes
        for i = 1:g.numberOfNodes
            for j = 1:g.numberOfNodes
                if pathLengths(i,k)+pathLengths(k,j) < pathLengths(i,j)
                    pathLengths(i,j) = pathLengths(i,k)+pathLengths(k,j);
                end
            end
        end
    end
    
    % Check the diagonal for negative elements
    if nnz(diag(pathLengths)<0) ~= 0
       warning('Graph contains negative cycles'); 
    end
    
end

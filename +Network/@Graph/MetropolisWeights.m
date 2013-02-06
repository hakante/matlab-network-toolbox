function metropolisWeights = MetropolisWeights( g )

    diagonalIndices = 1 : g.numberOfNodes+1 : g.numberOfNodes^2;

    adjacencyMatrixWithoutSelfloops = g.adjacencyMatrix;
    adjacencyMatrixWithoutSelfloops(diagonalIndices) = 0;
    
    maxRow = sum(adjacencyMatrixWithoutSelfloops,2);
    maxCol = sum(adjacencyMatrixWithoutSelfloops,1);

    if issparse(adjacencyMatrixWithoutSelfloops)
        [nzr, nzc, nzv] = find(adjacencyMatrixWithoutSelfloops);
        metropolisWeights = sparse(nzr, nzc, nzv ./ (max(maxRow(nzr),maxCol(nzc)')+1), g.numberOfNodes, g.numberOfNodes);
    else
        maxInOutDegrees = max(maxRow*ones(1,g.numberOfNodes), ones(g.numberOfNodes,1)*maxCol);
        metropolisWeights = adjacencyMatrixWithoutSelfloops ./ (maxInOutDegrees+1);
    end
    
    metropolisWeights(diagonalIndices) = 1 - sum(metropolisWeights,1);
    
end

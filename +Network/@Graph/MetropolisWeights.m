function metropolisWeights = MetropolisWeights( g )

    adjacencyMatrixWithoutSelfloops = g.adjacencyMatrix;
    adjacencyMatrixWithoutSelfloops(1:g.numberOfNodes+1:g.numberOfNodes^2) = 0;

    maxInOutDegrees = max(sum(adjacencyMatrixWithoutSelfloops,2)*ones(1,g.numberOfNodes), ...
        ones(g.numberOfNodes,1)*sum(adjacencyMatrixWithoutSelfloops,1));

    metropolisWeights = adjacencyMatrixWithoutSelfloops./((maxInOutDegrees+ones(g.numberOfNodes)));
    metropolisWeights = diag(1-sum(metropolisWeights,1))+metropolisWeights;
    
end

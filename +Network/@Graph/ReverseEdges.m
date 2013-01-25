function ReverseEdges( g )
    if ~g.isDirected
        warning('Graph is undirected');
    else
        g.pAdjacencyMatrix = g.pAdjacencyMatrix';
    end
end

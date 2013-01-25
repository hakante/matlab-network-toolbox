function neighbors = GetNeighborsOfNode( g, node )

    neighbors = find(g.adjacencyMatrix(node, :));
    
end

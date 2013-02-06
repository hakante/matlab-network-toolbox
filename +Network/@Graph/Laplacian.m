function laplacian = Laplacian( g )

    laplacian = diag(sum(g.adjacencyMatrix))-g.adjacencyMatrix;
    
end

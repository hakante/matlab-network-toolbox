function isConnected = IsConnected( g )

    isConnected = (nnz(abs(eig(g.Laplacian()))>eps) == g.numberOfNodes-1);
    
end

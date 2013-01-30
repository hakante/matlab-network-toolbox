function isConnected = IsConnected( g )

    isConnected = (nnz(abs(eig(g.Laplacian()))>1e-9) == g.numberOfNodes-1);
    
end

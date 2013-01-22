function bIsConnected = IsConnected( tNetwork )
	%
	aaiSelfloopLessAdjacencyMatrix =	...
		tNetwork.aaiAdjacencyMatrix - diag(diag(tNetwork.aaiAdjacencyMatrix));
	%
	aiNodesDegrees = sum(aaiSelfloopLessAdjacencyMatrix);
	%
	aaiLaplacianMatrix = diag( aiNodesDegrees ) - aaiSelfloopLessAdjacencyMatrix;
	%
	afLaplaciansEigenvalues = sort(eig( aaiLaplacianMatrix ), 'ascend');
	%
	bIsConnected = ( (afLaplaciansEigenvalues(2)^2) > eps );
	%
end %

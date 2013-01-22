function aaiSelfLoopedAdjacencyMatrix = GetSelfLoopedAdjacencyMatrix( tNetwork )
	%
	aaiSelfLoopedAdjacencyMatrix = tNetwork.aaiAdjacencyMatrix;
	%
	for iNode = 1:tNetwork.iNumberOfNodes;
		%
		aaiSelfLoopedAdjacencyMatrix(iNode, iNode) = 1;
		%
	end;%
	%
end %

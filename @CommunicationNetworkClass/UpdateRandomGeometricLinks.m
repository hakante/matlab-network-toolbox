function UpdateRandomGeometricLinks( tNetwork )
	%
	% initialization
	tNetwork.aaiAdjacencyMatrix = zeros( tNetwork.iNumberOfNodes, tNetwork.iNumberOfNodes );
	%
	for iNodeA = 1:tNetwork.iNumberOfNodes;
	for iNodeB = (iNodeA+1):tNetwork.iNumberOfNodes;
		%
		fEuclideanDistance =																			...
			(																							...
				(tNetwork.aafNodesPositions( iNodeA, 1 ) - tNetwork.aafNodesPositions( iNodeB, 1 ))^2	...
				+																						...
				(tNetwork.aafNodesPositions( iNodeA, 2 ) - tNetwork.aafNodesPositions( iNodeB, 2 ))^2	...
			)^(0.5);
		%
		if( fEuclideanDistance <= tNetwork.fCommunicationRadius )
			%
			tNetwork.aaiAdjacencyMatrix( iNodeA, iNodeB ) = 1;
			tNetwork.aaiAdjacencyMatrix( iNodeB, iNodeA ) = 1;
			%
			% DEBUG
% 			fprintf('(%.3f %.3f) - (%.3f %.3f)  =>  %.4f\n', tNetwork.aafNodesPositions( iNodeA, 1 ), tNetwork.aafNodesPositions( iNodeA, 2 ), tNetwork.aafNodesPositions( iNodeB, 1 ), tNetwork.aafNodesPositions( iNodeB, 2 ), fEuclideanDistance);
			%
		end;%
		%
	end;%
	end;%
	%
end %

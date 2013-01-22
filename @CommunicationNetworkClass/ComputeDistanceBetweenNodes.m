function iDistance = ComputeDistanceBetweenNodes( tNetwork, iNodeA, iNodeB )
	%
	% initialization of the algorithm
	bThereIsAZero				= true;
	iDistance					= 0;
	aaiRaisedAdjacencyMatrix	= eye( tNetwork.iNumberOfNodes );
	%
	while( bThereIsAZero )
		%
		iDistance					= iDistance + 1;
		aaiRaisedAdjacencyMatrix	= aaiRaisedAdjacencyMatrix * tNetwork.aaiAdjacencyMatrix;
		%
		% DEBUG
% 		fprintf('Distance computation: trying d = %d\n', iDistance);
		%
		if( aaiRaisedAdjacencyMatrix(iNodeA, iNodeB) ~= 0 )
			%
			bThereIsAZero = false;
			%
		end;%
		%
		if( iDistance > tNetwork.iNumberOfNodes )
			%
			iDistance = -1;
			fprintf('WARNING: there is more than one connected components\n');
			return;
			%
		end;%
		%
	end;%
	%
	% DEBUG
% 	fprintf('Distance between %d and %d = %d\n', iNodeA, iNodeB, iDistance);
	%
end %

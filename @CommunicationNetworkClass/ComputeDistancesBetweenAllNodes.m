function ComputeDistancesBetweenAllNodes( tNetwork )
	%
	% initialization
	tNetwork.aaiDistancesInHops = zeros( size( tNetwork.aaiAdjacencyMatrix ) );
	%
	for iNodeA = 1:tNetwork.iNumberOfNodes;
		%
		for iNodeB = (iNodeA+1):tNetwork.iNumberOfNodes;
			%
			tNetwork.aaiDistancesInHops(iNodeA, iNodeB) = tNetwork.ComputeDistanceBetweenNodes( iNodeA, iNodeB );
			tNetwork.aaiDistancesInHops(iNodeB, iNodeA) = tNetwork.aaiDistancesInHops( iNodeA, iNodeB );
			%
		end;%
		%
	end;%
	%
	% TODO: manage directed graphs
	%
end %

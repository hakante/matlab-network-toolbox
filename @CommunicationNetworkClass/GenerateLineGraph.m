function GenerateLineGraph( tNetwork )
	%
	% initialization
	aaiIdentity		= eye( tNetwork.iNumberOfNodes );
	aaiUpperPart	= zeros( size( aaiIdentity ) );
	%
	% find the upper part
	aaiUpperPart( :, 2:tNetwork.iNumberOfNodes )	= ...
		aaiIdentity( :, 1:(tNetwork.iNumberOfNodes-1)  );
	%
	% find the upper part
	aaiLowerPart = aaiUpperPart';
	%
	% create the adjacency matrix without selfloops
	tNetwork.aaiAdjacencyMatrix = aaiLowerPart + aaiUpperPart;
	%
	% in case add the self loops
	if( tNetwork.bUseSelfLoops )
		%
		tNetwork.aaiAdjacencyMatrix = tNetwork.aaiAdjacencyMatrix + aaiIdentity;
		%
	end;%
	%
	% set the nodes coordinates
	tNetwork.aafNodesPositions			= zeros(tNetwork.iNumberOfNodes, 2);
	tNetwork.aafNodesPositions(:, 1)	= linspace(0, 1, tNetwork.iNumberOfNodes);
	%
end %

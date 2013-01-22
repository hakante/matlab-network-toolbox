function GenerateCycleGraph( tNetwork )
	%
	% initialization
	aaiIdentity		= eye( tNetwork.iNumberOfNodes );
	aaiUpperPart	= zeros( size( aaiIdentity ) );
	%
	% find the upper part
	aaiUpperPart( :, 2:tNetwork.iNumberOfNodes )	= ...
		aaiIdentity( :, 1:(tNetwork.iNumberOfNodes-1)  );
	%
	aaiUpperPart( 1, tNetwork.iNumberOfNodes ) = 1;
	%
	% find the upper part
	aaiLowerPart = aaiUpperPart';
	%
	% find the adjacency matrix
	tNetwork.aaiAdjacencyMatrix = aaiIdentity + aaiLowerPart + aaiUpperPart;
	%
	% set the nodes coordinates
	aafNodesPositions = zeros(tNetwork.iNumberOfNodes, 2);
	%
	afAngles = linspace(0, 2*pi, tNetwork.iNumberOfNodes+1);
	%
	for iNode = 1:tNetwork.iNumberOfNodes;
		%
		tNetwork.aafNodesPositions(iNode, 1) = cos(afAngles(iNode));
		tNetwork.aafNodesPositions(iNode, 2) = sin(afAngles(iNode));
		%
	end;%
	%
end %

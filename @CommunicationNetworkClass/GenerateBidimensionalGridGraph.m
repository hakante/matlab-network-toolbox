function GenerateBidimensionalGridGraph( tNetwork )
	%
	% sanity check
	if( tNetwork.iNumberOfNodes ~= tNetwork.aiBidimensionalGridDimensions(1) * tNetwork.aiBidimensionalGridDimensions(2) )
		%
		error('number of nodes inconsistent with the definition of the grid dimensions');
		%
	end;%
	%
	% set the nodes coordinates
	tNetwork.aafNodesPositions = zeros(tNetwork.iNumberOfNodes, 2);
	%
	for iNodeIndex = 1:tNetwork.iNumberOfNodes;
		%
		iXIndex = mod( iNodeIndex, tNetwork.aiBidimensionalGridDimensions(1) );
		iYIndex = ceil( iNodeIndex / tNetwork.aiBidimensionalGridDimensions(1) );
		%
		tNetwork.aafNodesPositions(iNodeIndex, 1)	= iXIndex;
		tNetwork.aafNodesPositions(iNodeIndex, 2)	= iYIndex;
		%
		% DEBUG
		fprintf('node %d:   ( %d %d )\n', iNodeIndex, iXIndex, iYIndex);
		%
	end;%
	%
	%
	% set the nodes connections
	tNetwork.fCommunicationRadius = 1.1;
	tNetwork.UpdateRandomGeometricLinks();
	%
end %

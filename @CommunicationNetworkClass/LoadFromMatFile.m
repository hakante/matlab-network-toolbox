function LoadFromMatFile( tNetwork, strFileName ) 
	%
	load( strFileName );
	%
	tNetwork.aaiAdjacencyMatrix				= aaiAdjacencyMatrix;
	tNetwork.aafNodesPositions				= aafNodesPositions;
	tNetwork.iNumberOfNodes					= iNumberOfNodes;
	tNetwork.strKindOfGraph					= strKindOfGraph;
	tNetwork.fCommunicationRadius			= fCommunicationRadius;
	tNetwork.aiBidimensionalGridDimensions	= aiBidimensionalGridDimensions;
	tNetwork.strCommunicationKind			= strCommunicationKind;
	tNetwork.bUseSelfLoops					= bUseSelfLoops;
	%
	tNetwork.aiListOfSendersFromFile		= aiSenders;
	tNetwork.aacListOfReceiversFromFile		= aacReceivers;
	%
	tNetwork.ComputeDistancesBetweenAllNodes();
	tNetwork.ComputeDiameter();
	tNetwork.ComputeRadius();
	%
	tNetwork.ResetActivationsCounters();
	%
	fprintf('Network and communication protocol loaded from file\n');
	%
end %

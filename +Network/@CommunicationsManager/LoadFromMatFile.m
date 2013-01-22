function LoadFromMatFile( tCommunicationsManager, strFileName ) 
	%
	load( strFileName );
	%
	TODO
	%
	tCommunicationsManager.tGraph.GetAdjacencyMatrix()				= aaiAdjacencyMatrix;
	tCommunicationsManager.tGraph.aafNodesPositions				= aafNodesPositions;
	tCommunicationsManager.tGraph.iNumberOfNodes					= iNumberOfNodes;
	tCommunicationsManager.strKindOfGraph					= strKindOfGraph;
	tCommunicationsManager.fCommunicationRadius			= fCommunicationRadius;
	tCommunicationsManager.aiBidimensionalGridDimensions	= aiBidimensionalGridDimensions;
	tCommunicationsManager.strCommunicationKind			= strCommunicationKind;
	tCommunicationsManager.bUseSelfLoops					= bUseSelfLoops;
	%
	tCommunicationsManager.aiListOfSendersFromFile		= aiSenders;
	tCommunicationsManager.aacListOfReceiversFromFile		= aacReceivers;
	%
	tCommunicationsManager.ComputeDistancesBetweenAllNodes();
	tCommunicationsManager.ComputeDiameter();
	tCommunicationsManager.ComputeRadius();
	%
	tCommunicationsManager.ResetActivationsCounters();
	%
	fprintf('Network and communication protocol loaded from file\n');
	%
end %

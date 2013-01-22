% handles global properties like bounded intercommunication intervals
%
classdef CommunicationNetworkClass < handle
	%
	% ---------------------------------------------------------------------
	properties
		%
		bPrintDebugInformation;
		%
		iCurrentTime;
		%
		iNumberOfNodes;
		strKindOfGraph;
		%
		aafNodesPositions;
		aaiAdjacencyMatrix;
		aafNodesStatus;
		%
		aaiDistancesInHops;
		iDiameter;
		iRadius;
		%
		fCommunicationRadius;			% -1 indicates that the network is not a geometric network
		aiBidimensionalGridDimensions;	% -1 indicates that the network is not a bidimensional grid
		strCommunicationKind;			% 'directed' | 'undirected'
		bUseSelfLoops;
		bExtractLinksStartingFromANode;
		bLoadFromFile;
		%
		bForcePersistentActivationOfNodes;
		fIntervalOfPersistentActivationOfNodes;
		bForcePersistentActivationOfLinks;
		fIntervalOfPersistentActivationOfLinks;
		%
		% these quantities maintain information useful to assure
		% bounded intercommunication intervals assumptions (et similia)
		aaiActivatingLinksCounters;	% how many times every link has been activated
		aiActivatingNodesCounters;	% how many times every node has been activated
		aafActivatingLinksTimers;	% last time that every link has been activated
		afActivatingNodesTimers;	% last time that every node has been activated
		%
		iPersistentActivationOfNodesViolationsCounter;
		iPersistentActivationOfLinksViolationsCounter;
		%
		% if the communication protocol is loaded from file
		aiListOfSendersFromFile;
		aacListOfReceiversFromFile;
		%
	end %
	%
	%
	% ---------------------------------------------------------------------
	methods
		%
		% standard constructor
		function tNetwork = CommunicationNetworkClass( tParameters )
			%
			tNetwork.bPrintDebugInformation						= tParameters.bPrintDebugInformation;
			%
			tNetwork.iNumberOfNodes								= tParameters.iNumberOfNodes;
			tNetwork.strKindOfGraph								= tParameters.strKindOfGraph;
			tNetwork.aafNodesStatus								= [];
			%
			tNetwork.iCurrentTime								= 0;
			%
			tNetwork.fCommunicationRadius						= tParameters.fCommunicationRadius;
			tNetwork.aiBidimensionalGridDimensions				= tParameters.aiBidimensionalGridDimensions;
			tNetwork.strCommunicationKind						= tParameters.strCommunicationKind;
			tNetwork.bUseSelfLoops								= tParameters.bUseSelfLoops;
			%
			tNetwork.bExtractLinksStartingFromANode				= tParameters.bExtractLinksStartingFromANode;
			tNetwork.bLoadFromFile								= tParameters.bLoadCommunicationProtocolFromFile;
			%
			tNetwork.bForcePersistentActivationOfNodes			= tParameters.bForcePersistentActivationOfNodes;
			tNetwork.fIntervalOfPersistentActivationOfNodes		= tParameters.fIntervalOfPersistentActivationOfNodes;
			tNetwork.bForcePersistentActivationOfLinks			= tParameters.bForcePersistentActivationOfLinks;
			tNetwork.fIntervalOfPersistentActivationOfLinks		= tParameters.fIntervalOfPersistentActivationOfLinks;
			%
			tNetwork.iPersistentActivationOfNodesViolationsCounter	= 0;
			tNetwork.iPersistentActivationOfLinksViolationsCounter	= 0;
			%
			tNetwork.GenerateGraph();
			tNetwork.ComputeDistancesBetweenAllNodes();
			tNetwork.ComputeDiameter();
			tNetwork.ComputeRadius();
			%
			tNetwork.ResetActivationsCounters();
			%
			if( tNetwork.bLoadFromFile )
				%
				tNetwork.LoadFromMatFile( tParameters.strCommunicationProtocolFilepath );
				%
			end;%
			%
			if( tNetwork.bPrintDebugInformation )
				%
				tNetwork.Plot();
				%
			end;%
			%
			%
			fprintf('Network succesfully constructed\n');
			%
		end %
		%
	end %
	%
	%
end %
 

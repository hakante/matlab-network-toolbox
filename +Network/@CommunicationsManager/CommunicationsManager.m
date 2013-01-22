% handles global properties like bounded intercommunication intervals
%
classdef CommunicationsManager < handle
	%
	% ---------------------------------------------------------------------
	properties
		%
		bPrintDebugInformation;
		%
		tGraph;
		strCommunicationKind;			% 'directed' | 'undirected'
		%
		iCurrentTime;
		%
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
		function tCommunicationsManager = CommunicationsManager( tParameters )
			%
			tCommunicationsManager.bPrintDebugInformation			= tParameters.bPrintDebugInformation;
			tCommunicationsManager.strCommunicationKind				= tParameters.strCommunicationKind;
			tCommunicationsManager.tGraph							= Network.Graph( tParameters );
			tCommunicationsManager.iCurrentTime						= 0;
			%
			tCommunicationsManager.bExtractLinksStartingFromANode	= tParameters.bExtractLinksStartingFromANode;
			tCommunicationsManager.bLoadFromFile					= tParameters.bLoadCommunicationProtocolFromFile;
			%
			tCommunicationsManager.bForcePersistentActivationOfNodes			= tParameters.bForcePersistentActivationOfNodes;
			tCommunicationsManager.fIntervalOfPersistentActivationOfNodes		= tParameters.fIntervalOfPersistentActivationOfNodes;
			tCommunicationsManager.bForcePersistentActivationOfLinks			= tParameters.bForcePersistentActivationOfLinks;
			tCommunicationsManager.fIntervalOfPersistentActivationOfLinks		= tParameters.fIntervalOfPersistentActivationOfLinks;
			%
			tCommunicationsManager.iPersistentActivationOfNodesViolationsCounter	= 0;
			tCommunicationsManager.iPersistentActivationOfLinksViolationsCounter	= 0;
			%
			tCommunicationsManager.ResetActivationsCounters();
			%
			if( tCommunicationsManager.bLoadFromFile )
				%
				tCommunicationsManager.LoadFromMatFile( tParameters.strCommunicationProtocolFilepath );
				%
			end;%
			%
			%
			if( tCommunicationsManager.bPrintDebugInformation )
				%
				fprintf('Communications manager succesfully constructed\n');
				%
			end;%
			%
		end %
		%
	end %
	%
	%
end %
 

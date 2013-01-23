% ----------------------------------------------------------------------- %
% GRAPH
tParameters.iNumberOfNodes					= 20;
tParameters.iMaximalNumberOfNodes			= 40;
tParameters.strKindOfGraph					= 'random geometric'; % 'line' | 'cycle' | 'random geometric' | 'bidimensional grid'
%
tParameters.fCommunicationRadius			= 0.5; % for random geometric graphs
tParameters.aiBidimensionalGridDimensions	= [4, 5];
tParameters.bUseSelfLoops					= false;



% ----------------------------------------------------------------------- %
% COMMUNICATION PROTOCOL
tParameters.bForcePersistentActivationOfNodes		= true;							% every node must be activated at least once in the time interval specified below
tParameters.fIntervalOfPersistentActivationOfNodes	= 5*tParameters.iNumberOfNodes; % bounded intercommunications interval
tParameters.bForcePersistentActivationOfLinks		= true;							% every link must be activated at least once in the time interval specified below
tParameters.fIntervalOfPersistentActivationOfLinks	= tParameters.iNumberOfNodes^2; % bounded intercommunications interval
%
tParameters.bUseDirectedCommunications				= false;	% true = directed,  false = undirected
tParameters.bUseBroadcastCommunications				= true;		% true = broadcast, false = gossip
tParameters.bExtractLinksStartingFromANode			= true;		% true = randomly select a node then randomly select a neighbor | false = randomly select a link
%
tParameters.bLoadCommunicationProtocolFromFile		= false;



% ----------------------------------------------------------------------- %
% CONDITIONAL SAVINGS / PLOTTINGS
tParameters.bSaveResults			= true;
tParameters.bPlotResults			= true;
tParameters.bPrintDebugInformation	= false;


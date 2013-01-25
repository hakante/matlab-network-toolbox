clc;
clear all;


Network.LoadParameters;


% create the network; note: gossip => do not use broadcasts
tParameters.bUseBroadcastCommunications = false;
tCommunicationsManager = Network.CommunicationsManager( tParameters );


% allocate the consensus nodes
for iNode = 1:tParameters.iNumberOfNodes;
	%
	atConsensusNodes(iNode) =				...
		Network.ConsensusNode(	iNode,		...
								1,			...
								12,			...
								'gaussian',	...
								'accelerated gossip', 0.5, 0.1 ); %#ok<SAGROW>
	%
end;%


% run the communications protocol
% while( tCommunicationsManager.ShouldCommunicate() )
while( Network.ConsensusNode.DissensusOf( atConsensusNodes ) > 0.2 )
	%
	% increase the time index
	tCommunicationsManager.IncreaseCurrentTime();
	%
	% extract the sender
	iSender = tCommunicationsManager.ExtractNode();
	%
	% extract the (possibly more than one) receivers
	aiReceivers = tCommunicationsManager.ExtractReceivers( iSender );
	%
	% perform the consensus step
	atConsensusNodes = ...
		atConsensusNodes(iSender).DoConsensusStep( atConsensusNodes, aiReceivers );
	%
	%
	% DEBUG
	fprintf('time %d, dissensus = %.5f\n',							...
			tCommunicationsManager.iCurrentTime,					...
			Network.ConsensusNode.DissensusOf( atConsensusNodes )	);
% 	for iNode = 1:tParameters.iNumberOfNodes;
% 		atConsensusNodes(iNode).Print( false );
% 	end;%
% 	pause;
	%
end;%


fprintf('communications executed\n');

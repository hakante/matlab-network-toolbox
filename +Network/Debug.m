clc;
clear all;
close all;


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
								'deterministic',	...
								'hadjicostis', iNode ); %#ok<SAGROW>
	%
end;%


% run the communications protocol
% while( tCommunicationsManager.ShouldCommunicate() )
while( Network.ConsensusNode.DissensusOf( atConsensusNodes ) > 2 )
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
	% DEBUG
	fprintf('time %d, dissensus = %.5f\n',							...
			tCommunicationsManager.iCurrentTime,					...
			Network.ConsensusNode.DissensusOf( atConsensusNodes )	);
% 	for iNode = 1:tParameters.iNumberOfNodes;
% 		atConsensusNodes(iNode).Print( false );
% 	end;%
% 	pause;
% 	for iNode = 1:tParameters.iNumberOfNodes;
% 		aafConsensusValues(tCommunicationsManager.iCurrentTime, iNode) = ...
% 			atConsensusNodes(iNode).afAuxiliaryConsensusVectorA(1);
% 	end;%
	%
end;%


fprintf('communications executed\n');


% DEBUG
% figure(1)
% hold on;
% for iNode = 1:tParameters.iNumberOfNodes;
% 	plot( aafConsensusValues(:, iNode) );
% end;%
% hold off;

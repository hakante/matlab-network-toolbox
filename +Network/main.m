clc;
clear all;


Network.LoadParameters;


% create the network
tCommunicationsManager = Network.CommunicationsManager( tParameters );


% run the communications protocol
while( tCommunicationsManager.ShouldCommunicate() )
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
end;%


fprintf('communications executed\n');

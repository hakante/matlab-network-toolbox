% assumption: the graph is connected
%
% it has selfloops iff aaiAjacencyMatrix admits selfloops
%
function aiReceivers = ExtractReceivers( tCommunicationsManager, iSender )
	%
	%
	% get the neighbors (but not the self-loop link)
	aiNeighborsOfSender = tCommunicationsManager.tGraph.GetNeighborsOfNode( iSender, false );
	%
	%
	% select the receivers
	if( tCommunicationsManager.bUseBroadcastCommunications )
		%
		% in this case, transmit to everybody
		aiReceivers = aiNeighborsOfSender;
		%
	else%
		%
		% in this other case, transmit just to one
		aiReceivers = aiNeighborsOfSender( randi( numel(aiNeighborsOfSender) ) );
		%
	end;%
	%
	%
	% update the links extractions counters
	for iReceiverIndex = 1:numel(aiReceivers);
		%
		tCommunicationsManager.UpdateLinkActivationsCounter( iSender, aiReceivers(iReceiverIndex) );
		%
	end;%
	%
end %

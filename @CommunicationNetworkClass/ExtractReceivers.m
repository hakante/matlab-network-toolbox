% assumption: the graph is connected
%
% it has selfloops iff aaiAjacencyMatrix admits selfloops
%
function aiReceivers = ExtractReceivers( tNetwork, tSender, fCurrentTime )
	%
	%
	% get the neighbors (but not the self-loop link)
	aiNeighborsOfSender = tNetwork.GetNeighborsOfNode( tSender.iLabel, false );
	%
	%
	% select the list of receivers
	switch( tSender.iConsensusKind )
		%
		case {tSender.MAX_CONSENSUS, tSender.AVERAGE_BY_RATIOS_CONSENSUS}
			%
			aiReceivers = aiNeighborsOfSender;
		%
		case {tSender.AVERAGE_CONSENSUS, tSender.ACCELERATED_AVERAGE_CONSENSUS}
			%
			aiReceivers = aiNeighborsOfSender( randi( numel(aiNeighborsOfSender) ) );
		%
		otherwise
			%
			error('wrong consensus kind!');
		%
	end;% switch on consensus kind
	%
	%
	% update the links extractions counters
	for iReceiverIndex = 1:numel(aiReceivers);
		%
		tNetwork.UpdateLinkActivationsCounter( tSender.iLabel, aiReceivers(iReceiverIndex), fCurrentTime );
		%
	end;%
	%
end %

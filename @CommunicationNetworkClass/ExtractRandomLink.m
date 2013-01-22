% assumption: the graph is connected
%
% it has selfloops iff aaiAjacencyMatrix admits selfloops
%
function [iSender iReceiver] = ExtractRandomLink( tNetwork, fCurrentTime )
	%
	% 
	if( tNetwork.bExtractLinksStartingFromANode )
		%
		% select the sender
		iSender = tNetwork.ExtractRandomNode( fCurrentTime );
		%
		% get his neighbors
		aiNeighborsOfSender = tNetwork.GetNeighborsOfNode( iSender );
		%
		% select the receiver
		if( numel(aiNeighborsOfSender) > 0 )
			%
			iReceiver = aiNeighborsOfSender( randi( numel(aiNeighborsOfSender) ) );
			%
		else%
			%
			iReceiver = -1;
			%
		end;%
		%
		% update the counters
		tNetwork.UpdateLinkActivationsCounter( iSender, iReceiver, fCurrentTime );
		%
	else%
		%
		% check if some links must activate
		aabLinksThatMustActivateNow = tNetwork.GetLinksViolatingPersistentActivation( fCurrentTime );
		%
		if( sum(sum(aabLinksThatMustActivateNow)) > 0 )
			%
			aabLinksThatCanActivate = aabLinksThatMustActivateNow;
			%
		else%
			%
			aabLinksThatCanActivate = tNetwork.aaiAdjacencyMatrix;
			%
		end;%
		%
		% put all the 0s and 1s one on top of the other
		abStackedCanBeActivatedLinksFlags = aabLinksThatCanActivate(:); % : stacks up by column, i.e. the resulting column will be: first column; second column; etc
		%
		% transform the 1s in is (1, 2, 3, etc)
		aiStackedCanBeActivatedLinksIndexes = abStackedCanBeActivatedLinksFlags .* (1:numel(abStackedCanBeActivatedLinksFlags))';
		%
		% remove the zeros from the vector
		aiStackedCanBeActivatedLinksIndexesWithoutZeros =	...
			aiStackedCanBeActivatedLinksIndexes( aiStackedCanBeActivatedLinksIndexes ~= 0 );
		%
		% extract the to be activated link index
		iLinkIndex = aiStackedCanBeActivatedLinksIndexesWithoutZeros( randi( numel(aiStackedCanBeActivatedLinksIndexesWithoutZeros) ) );
		%
		% find the sender (sender = row index)
		iSender = mod(iLinkIndex, tNetwork.iNumberOfNodes);
		if( iSender == 0 )
			%
			% sometimes the "sender" is the last node...
			iSender = tNetwork.iNumberOfNodes;
			%
		end;%
		%
		% find the receiver (receiver = col. index);
		iReceiver = mod((iLinkIndex - iSender) / tNetwork.iNumberOfNodes + 1, tNetwork.iNumberOfNodes);
		if( iReceiver == 0 )
			%
			% sometimes the "receiver" is the last node...
			iReceiver = tNetwork.iNumberOfNodes;
			%
		end;%
		%
	end;%
	%
	% update the counters
	tNetwork.UpdateActivationsCounters( iSender, iReceiver, fCurrentTime );
	%
	%
	% DEBUG
% 	disp(aabLinksThatCanActivate);
% 	disp(aiStackedCanBeActivatedLinksIndexes);
% 	disp(iLinkIndex);
% 	fprintf('%d %d\n', iSender, iReceiver);
	%
end %

function bIsValid = IsLinkValid(tNetwork, iSender, iReceiver)
	%
	% check if the indexes are meaningful
	if(											...
			iSender < 1							...
		||	iSender > tNetwork.iNumberOfNodes	...
		||	iReceiver < 1						...
		||	iReceiver > tNetwork.iNumberOfNodes	...
	  )
		%
		bIsValid = false;
		return;
		%
	end;%
	%
	% here we can also check if the link is in the adjacency matrix
	bIsValid = tNetwork.aaiAdjacencyMatrix( iSender, iReceiver );
	%
end %

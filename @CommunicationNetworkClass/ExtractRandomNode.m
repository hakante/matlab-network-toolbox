% assumption: the graph is connected
%
% it has selfloops iff aaiAjacencyMatrix admits selfloops
%
function iNode = ExtractRandomNode( tNetwork, fCurrentTime )
	%
	% check if some nodes must activate
	aiNodesThatMustActivateNow = tNetwork.GetNodesViolatingPersistentActivation( fCurrentTime );
	%
	% if no nodes must commnicate then extract randomly, otherwise extract
	% randomly among the ones that must activate now
	if( numel(aiNodesThatMustActivateNow) > 0 )
		%
		aiNodesThatCanActivate = aiNodesThatMustActivateNow;
		%
	else%
		%
		aiNodesThatCanActivate = 1:tNetwork.iNumberOfNodes;
		%
	end;%
	%
	% for readability
	iNumberOfNodesThatCanActivate = numel( aiNodesThatCanActivate );
	%
	% select the node
	iNodeIndex	= randi( iNumberOfNodesThatCanActivate );
	iNode		= aiNodesThatCanActivate( iNodeIndex );
	%
	% update the counters
	tNetwork.UpdateNodeActivationsCounter( iNode, fCurrentTime );
	%
end %

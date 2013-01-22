function UpdateNodeActivationsCounter( tNetwork, iNode, fCurrentTime )
	%
	tNetwork.aiActivatingNodesCounters(iNode) = ...
		tNetwork.aiActivatingNodesCounters(iNode) + 1;
	%
	tNetwork.afActivatingNodesTimers(iNode) = fCurrentTime;
	%
end %

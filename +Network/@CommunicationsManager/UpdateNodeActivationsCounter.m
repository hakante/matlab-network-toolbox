function UpdateNodeActivationsCounter( tCommunicationsManager, iNode, fCurrentTime )
	%
	tCommunicationsManager.aiActivatingNodesCounters(iNode) = ...
		tCommunicationsManager.aiActivatingNodesCounters(iNode) + 1;
	%
	tCommunicationsManager.afActivatingNodesTimers(iNode) = fCurrentTime;
	%
end %

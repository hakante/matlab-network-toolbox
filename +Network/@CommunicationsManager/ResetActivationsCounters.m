function ResetActivationsCounters( tCommunicationsManager )
	%
	tCommunicationsManager.aaiActivatingLinksCounters	= zeros( tCommunicationsManager.tGraph.iNumberOfNodes, tCommunicationsManager.tGraph.iNumberOfNodes );
	tCommunicationsManager.aiActivatingNodesCounters	= zeros( tCommunicationsManager.tGraph.iNumberOfNodes, 1 );
	tCommunicationsManager.aafActivatingLinksTimers		= zeros( tCommunicationsManager.tGraph.iNumberOfNodes, tCommunicationsManager.tGraph.iNumberOfNodes );
	tCommunicationsManager.afActivatingNodesTimers		= zeros( tCommunicationsManager.tGraph.iNumberOfNodes, 1 );
	%
end %

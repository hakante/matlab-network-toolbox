function ResetActivationsCounters( tNetwork )
	%
	tNetwork.aaiActivatingLinksCounters	= zeros( tNetwork.iNumberOfNodes, tNetwork.iNumberOfNodes );
	tNetwork.aiActivatingNodesCounters	= zeros( tNetwork.iNumberOfNodes, 1 );
	tNetwork.aafActivatingLinksTimers	= zeros( tNetwork.iNumberOfNodes, tNetwork.iNumberOfNodes );
	tNetwork.afActivatingNodesTimers	= zeros( tNetwork.iNumberOfNodes, 1 );
	%
end %

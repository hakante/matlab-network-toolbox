function tNode = SetLabels( tNode )
	%
	tNode.AVERAGE_CONSENSUS				= 1;
	tNode.ACCELERATED_AVERAGE_CONSENSUS	= 2;
	tNode.AVERAGE_BY_RATIOS_CONSENSUS	= 3;
	tNode.MAX_CONSENSUS					= 4;
	%
	tNode.GAUSSIAN						= 11;
	tNode.UNIFORM						= 12;
	tNode.BERNOULLI_MULTI_BITS			= 13;
	tNode.BERNOULLI_SINGLE_BITS			= 14;
	%
end %

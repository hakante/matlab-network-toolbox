function tNode = SetLabels( tNode, iLabel )
	%
	tNode.iLabel				= iLabel;
	%
	tNode.GOSSIP				= 1;
	tNode.ACCELERATED_GOSSIP	= 2;
	tNode.HADJACOSTIS			= 3;
	tNode.MAX					= 4;
	%
	tNode.DETERMINISTIC			= 11;
	tNode.GAUSSIAN				= 12;
	tNode.UNIFORM				= 13;
	tNode.BERNOULLI_MULTI_BITS	= 14;
	tNode.BERNOULLI_SINGLE_BITS	= 15;
	%
end %

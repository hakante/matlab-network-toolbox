function tNode = SetConsensusKind( tNode, tParameters )
	%
	switch( tParameters.strConsensusKind )
		%
		case 'average'
			%
			tNode.iConsensusKind				= tNode.AVERAGE_CONSENSUS;
			tNode.fConsensusWeight				= tParameters.fConsensusWeight;
		%
		case 'accelerated average'
			%
			tNode.iConsensusKind				= tNode.ACCELERATED_AVERAGE_CONSENSUS;
			tNode.fConsensusWeight				= tParameters.fConsensusWeight;
			tNode.fConsensusAccelerationFactor	= tParameters.fConsensusAccelerationFactor;
		%
		case 'average by ratios'
			%
			tNode.iConsensusKind				= tNode.AVERAGE_BY_RATIOS_CONSENSUS;
		%
		case 'max'
			%
			tNode.iConsensusKind				= tNode.MAX_CONSENSUS;
		%
		otherwise
			%
			disp(strConsensusKind);
			error('wrong consensus kind selection!');
		%
	end;%
	%
	%
	%
	if( tNode.bPrintDebugInformation )
		%
		fprintf('Consensus kind of node %d set to %d (%s)\n', tNode.iLabel, tNode.iConsensusKind, tParameters.strConsensusKind);
		%
	end;%
	%
end %

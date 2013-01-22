function tNode = SetLocalGenerationKind( tNode, tParameters )
	%
	switch( tParameters.strLocalGenerationKind )
		%
		case 'gaussian'
			%
			tNode.iLocalGenerationKind = tNode.GAUSSIAN;
		%
		case 'uniform'
			%
			tNode.iLocalGenerationKind = tNode.UNIFORM;
		%
		case 'bernoulli multi-bits'
			%
			tNode.iLocalGenerationKind = tNode.BERNOULLI_MULTI_BITS;
			tNode.tBernoulliMultibitsEstimator = ...
				BernoulliMultibitsEstimatorClass( tParameters, tNode.iLabel );
		%
		case 'bernoulli single-bits'
			%
			tNode.iLocalGenerationKind = tNode.BERNOULLI_SINGLE_BITS;
		%
		otherwise
			%
			disp( tParameters.strLocalGenerationKind );
			error('wrong local generation kind selection!');
		%
	end;%
	%
	%
	%
	if( tNode.bPrintDebugInformation )
		%
		fprintf('Local generation kind of node %d set to %d (%s)\n', tNode.iLabel, tNode.iLocalGenerationKind, tParameters.strLocalGenerationKind);
		%
	end;%
	%
end %

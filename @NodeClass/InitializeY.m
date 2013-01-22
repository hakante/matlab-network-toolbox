function tNode = InitializeY( tNode )
	%
	%
	% the normal Y is generated dependently on the local generation kind
	switch( tNode.iLocalGenerationKind )
		%
		case tNode.GAUSSIAN;
			%
			% here we decrease the variance by dividing by "8", so that we
			% do not exit the quantization domain
			tNode.afY = tNode.Quantize( (randn( tNode.iNumberOfTrials, 1 ) * 2^tNode.iNumberOfBits) / 8 );
		%
		case tNode.UNIFORM;
			%
			tNode.afY = tNode.Quantize( rand( tNode.iNumberOfTrials, 1 ) * 2^tNode.iNumberOfBits );
		%
		case {tNode.BERNOULLI_MULTI_BITS, tNode.BERNOULLI_SINGLE_BITS};
			%
			tNode.afY = tNode.Quantize( randi( [0, 1], tNode.iNumberOfTrials, 1 ) * 2^tNode.iNumberOfBits );
		%
		otherwise
			%
			disp( tNode.iLocalGenerationKind );
			error('wrong local generation kind selection!');
		%
	end;% switch on the local generation kind
	%
	%
	% the auxiliary Y is generated dependently on the consensus kind
	switch( tNode.iConsensusKind )
		%
		case {	tNode.AVERAGE_CONSENSUS,				...
				tNode.ACCELERATED_AVERAGE_CONSENSUS,	...
				tNode.MAX_CONSENSUS						}
			%
			tNode.afAuxiliaryY	= zeros( tNode.iNumberOfTrials, 1 ) * 2^tNode.iNumberOfBits;
		%
		case tNode.AVERAGE_BY_RATIOS_CONSENSUS
			%
			tNode.afAuxiliaryY	= ones( tNode.iNumberOfTrials, 1 ) * 2^tNode.iNumberOfBits;
		%
		otherwise
			%
			error('wrong consensus kind');
		%
	end;% switch on the consensus kind
	%
	%
end %

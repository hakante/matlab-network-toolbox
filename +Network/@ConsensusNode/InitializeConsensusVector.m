function tNode = InitializeConsensusVector( tNode, iNumberOfElements, varargin )
	%
	% store the internal parameters
	tNode.iNumberOfElements = iNumberOfElements;
	%
	afVarargin = cell2mat(varargin{1});
	%
	% the normal vector is generated dependently on the local generation kind
	switch( tNode.iLocalGenerationKind )
		%
		case tNode.DETERMINISTIC;
			%
			% here we make a set of ones times the last argument of
			% varargin
			tNode.afConsensusVector = tNode.Quantize( afVarargin(end) .* ones( iNumberOfElements, 1 ) );
		%
		case tNode.GAUSSIAN;
			%
			% here we decrease the variance by dividing by "8", so that we
			% do not exit the quantization domain
			tNode.afConsensusVector = tNode.Quantize( (randn( iNumberOfElements, 1 ) * 2^tNode.iNumberOfBits) / 8 );
		%
		case tNode.UNIFORM;
			%
			tNode.afConsensusVector = tNode.Quantize( rand( iNumberOfElements, 1 ) * 2^tNode.iNumberOfBits );
		%
		case {tNode.BERNOULLI_MULTI_BITS, tNode.BERNOULLI_SINGLE_BITS};
			%
			tNode.afConsensusVector = tNode.Quantize( randi( [0, 1], iNumberOfElements, 1 ) * 2^tNode.iNumberOfBits );
		%
		otherwise
			%
			disp( tNode.iLocalGenerationKind );
			error('wrong local generation kind selection!');
		%
	end;% switch on the local generation kind
	%
	%
	% the auxiliary vector is generated dependently on the consensus kind
	switch( tNode.iConsensusKind )
		%
		case {	tNode.DETERMINISTIC,		...
				tNode.GOSSIP,				...
				tNode.ACCELERATED_GOSSIP,	...
				tNode.MAX					}
			%
			tNode.afAuxiliaryConsensusVectorA = zeros( iNumberOfElements, 1 ) * 2^tNode.iNumberOfBits;
		%
		case tNode.HADJACOSTIS
			%
			tNode.afAuxiliaryConsensusVectorA = tNode.afConsensusVector;
			tNode.afAuxiliaryConsensusVectorB = ones( iNumberOfElements, 1 ) * 2^tNode.iNumberOfBits;
		%
		otherwise
			%
			error('wrong consensus kind');
		%
	end;% switch on the consensus kind
	%
	%
end %

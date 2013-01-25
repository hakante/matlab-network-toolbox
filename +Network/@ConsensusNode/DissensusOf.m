function fDissensus = DissensusOf( atNodes )
	%
	% compute the biggest and smallest vectors
	afBiggestComponents		= 0;
	afSmallestComponents	= 999999999999999 * ones( size(atNodes(1).afConsensusVector) );
	%
	for iNode = 1:numel( atNodes )
		%
		afBiggestComponents		= max( afBiggestComponents,		atNodes(iNode).afConsensusVector );
		afSmallestComponents	= min( afSmallestComponents,	atNodes(iNode).afConsensusVector );
		%
	end;%
	%
	fDissensus = norm( afBiggestComponents - afSmallestComponents );
	%
end %

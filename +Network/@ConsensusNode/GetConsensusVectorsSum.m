function fSum = GetConsensusVectorsSum( atNodes )
	%
	fSum = 0;
	%
	for iIndex = 1:numel( atNodes );
		%
		fSum = fSum + sum( atNodes(iIndex).afConsensusVector );
		%
	end;%
	%
end %

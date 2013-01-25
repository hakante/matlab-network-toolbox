function Print( tNode, bBeVerbose )
	%
	if( bBeVerbose )
		%
		fprintf('consensus node %d  (parameters: %d %d %d)\n', tNode.iLabel, tNode.iConsensusKind, tNode.iLocalGenerationKind, tNode.iNumberOfBits );
		%
		fprintf('\tconsensus vector:\t');
		%
		for iElement = 1:tNode.iNumberOfElements;
			%
			fprintf('%.3f\t', tNode.afConsensusVector(iElement) );
			%
		end;%
		%
	else%
		%
		fprintf('n%d:\t', tNode.iLabel );
		%
		for iElement = 1:tNode.iNumberOfElements;
			%
			fprintf('%.2f\t', tNode.afConsensusVector(iElement) );
			%
		end;%
		%
	end;%
	%
	fprintf('\n');
	%
end %

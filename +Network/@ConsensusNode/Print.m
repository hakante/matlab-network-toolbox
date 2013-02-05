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
		fprintf('\n\tcurrent estimate: %.3f\n', tNode.fCurrentEstimate);
		%
	else%
		%
		fprintf('n%d:\t%.3f\n', tNode.iLabel, tNode.fCurrentEstimate );
		%
	end;%
	%
end %

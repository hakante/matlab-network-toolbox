function afQuantizedValues = Quantize( tNode, afNonQuantizedValues )
	%
	afQuantizedValues =        min( afNonQuantizedValues, tNode.aiQuantizedDomain(2) );
	afQuantizedValues = round( max( afQuantizedValues,    tNode.aiQuantizedDomain(1) ));
	%
	% OLD CODE (more general)
% 	% storage allocation
% 	aafQuantizedValues = zeros( size(aafNonQuantizedValues) );
% 	%
% 	% for readability
% 	iNumberOfRows		= numel(aafNonQuantizedValues( :, 1 ));
% 	iNumberOfColumns	= numel(aafNonQuantizedValues( 1, : ));
% 	%
% 	for iRow = 1:iNumberOfRows;
% 		%
% 		for iCol = 1:iNumberOfColumns;
% 			%
% 			afDifferencesWithQuantizedDomain =				...
% 					aafNonQuantizedValues(iRow, iCol)		...
% 				-	tNode.afQuantizedDomain;
% 			%
% 			[fMinimalAbsoluteDifference, iMinimalAbsoluteDifferenceIndex] =	...
% 				min( abs(afDifferencesWithQuantizedDomain) );
% 			%
% 			aafQuantizedValues(iRow, iCol) =					...
% 					aafNonQuantizedValues(iRow, iCol)			...
% 				-		fMinimalAbsoluteDifference				...
% 					*	sign( afDifferencesWithQuantizedDomain(iMinimalAbsoluteDifferenceIndex) );
% 			%
% 		end;%
% 		%
% 	end;%
	%
end %

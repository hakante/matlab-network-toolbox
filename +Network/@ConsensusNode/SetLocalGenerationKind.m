function tNode = SetLocalGenerationKind( tNode, strLocalGenerationKind )
	%
	switch( strLocalGenerationKind )
		%
		case 'deterministic'
			%
			tNode.iLocalGenerationKind = tNode.DETERMINISTIC;
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
		%
		case 'bernoulli single-bits'
			%
			tNode.iLocalGenerationKind = tNode.BERNOULLI_SINGLE_BITS;
		%
		otherwise
			%
			disp( strLocalGenerationKind );
			error('wrong local generation kind selection!');
		%
	end;%
	%
end %

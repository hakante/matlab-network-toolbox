function tNode = InitializeQuantizer( tNode, iNumberOfBits )
	%
	tNode.iNumberOfBits = iNumberOfBits;
	%
	switch( tNode.iLocalGenerationKind )
		%
		case {tNode.GAUSSIAN, tNode.DETERMINISTIC}
			%
			tNode.aiQuantizedDomain(1) = -2^(tNode.iNumberOfBits-1)+1;
			tNode.aiQuantizedDomain(2) =  2^(tNode.iNumberOfBits-1);
		%
		case {tNode.UNIFORM, tNode.BERNOULLI_MULTI_BITS, tNode.BERNOULLI_SINGLE_BITS}
			%
			tNode.aiQuantizedDomain(1) =  1;
			tNode.aiQuantizedDomain(2) =  2^tNode.iNumberOfBits;
		%
		otherwise
			%
			disp( tNode.iLocalGenerationKind );
			error('wrong (or missing) local generation kind selection!');
		%
	end;%
	%
end %

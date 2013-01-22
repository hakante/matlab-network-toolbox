function tNode = UpdateLocalGuess( tNode )
	%
	%
	if( tNode.bPrintDebugInformation )
		fprintf('node %d: x : %.3f -> ', tNode.iLabel, tNode.fLocalGuess);
	end;%
	%
	%
	% normalize the measurements
	afMeasurements = tNode.afY / 2^tNode.iNumberOfBits;
	%
	%
	switch( tNode.iConsensusKind)
		%
		case {	tNode.AVERAGE_CONSENSUS,			...
				tNode.ACCELERATED_AVERAGE_CONSENSUS	}
			%
			switch( tNode.iLocalGenerationKind )
				%
				case tNode.GAUSSIAN
					%
					% recall that we use "8" to decrease the variance of
					% the initial generation of measurements (otherwise it
					% goes outside of the quantized domain)
					tNode.fLocalGuess = (  mean( (afMeasurements * 8).^(2) )  )^(-1);
				%
				case tNode.BERNOULLI_MULTI_BITS
					%
					tNode.fLocalGuess = tNode.tBernoulliMultibitsEstimator.Estimate( afMeasurements );
				%
				otherwise
					%
					error( 'wrong combination "local generation kind" + "consensus kind"' );
				%
			end;%
		%
		%
		%
		case tNode.AVERAGE_BY_RATIOS_CONSENSUS
			%
			% normalize also the auxiliary measurements
			afAuxiliaryMeasurements = tNode.afAuxiliaryY / 2^tNode.iNumberOfBits;
			%
			% compute the measurements ratio
			afMeasurementsRatio = afMeasurements ./ afAuxiliaryMeasurements;
			%
			switch( tNode.iLocalGenerationKind )
				%
				case tNode.GAUSSIAN
					%
					% recall that we use "8" to decrease the variance of
					% the initial generation of measurements (otherwise it
					% goes outside of the quantized domain)
					%
					% compute the guess
					tNode.fLocalGuess = (  mean( (afMeasurementsRatio * 8).^(2) )  )^(-1);
				%
				case tNode.BERNOULLI_MULTI_BITS
					%
					tNode.fLocalGuess = tNode.tBernoulliMultibitsEstimator.Estimate( afMeasurementsRatio );
				%
				otherwise
					%
					error( 'wrong combination "local generation kind" + "consensus kind"' );
				%
			end;%
		%
		%
		%
		case tNode.MAX_CONSENSUS
			%
			switch( tNode.iLocalGenerationKind )
				%
				case tNode.UNIFORM
					%
					tNode.fLocalGuess = (  - mean( log(afMeasurements) )  )^(-1);
				%
				case tNode.BERNOULLI_SINGLE_BITS
					%
					error( 'still not supported combination "local generation kind" + "consensus kind"' );
				%
				otherwise
					%
					error( 'wrong combination "local generation kind" + "consensus kind"' );
				%
			end;%
		%
		%
		otherwise
			%
			error( 'wrong combination consensus kind' );
		%
		%
	end;% switch on consensus kind
	%
	%
	if( tNode.bPrintDebugInformation )
		fprintf('%.3f\n', tNode.fLocalGuess);
	end;%
	%
end %

function atNodes = CommunicateWithUsingAcceleratedAverageConsensus( tSender, atNodes, iReceiver )
	%
	%
	% consistency check
	if( numel( iReceiver ) ~= 1 )
		%
		error('wrong number of receivers');
		%
	end;%
	%
	%
	% temporary variables
	afSenderCurrentY	= atNodes( tSender.iLabel ).afY;
	afReceiverCurrentY	= atNodes( iReceiver ).afY;
	%
	afSenderPastY		= atNodes( tSender.iLabel ).afAuxiliaryY;
	afReceiverPastY		= atNodes( iReceiver ).afAuxiliaryY;
	%
	%
	% DEBUG
	if( atNodes( tSender.iLabel ).bPrintDebugInformation )
		%
		fPreviousSum = tSender.ComputeSumOfYs( atNodes, iReceiver );
		%
	end;%
	%
	%
	% make the weighted consensus step
	afSenderWeightedY =																...
			afSenderCurrentY														...
		-	atNodes( tSender.iLabel ).fConsensusWeight * round( afSenderCurrentY )	...
		+	atNodes( tSender.iLabel ).fConsensusWeight * round( afReceiverCurrentY );
	%
	afReceiverWeightedY =														...
			afReceiverCurrentY													...
		-	atNodes( iReceiver ).fConsensusWeight * round( afReceiverCurrentY )	...
		+	atNodes( iReceiver ).fConsensusWeight * round( afSenderCurrentY );
	%
	%
	% save the past values
	atNodes( tSender.iLabel ).afAuxiliaryY	= atNodes( tSender.iLabel ).afY;
	atNodes( iReceiver ).afAuxiliaryY		= atNodes( iReceiver ).afY;
	%
	%
	% weight with the forecasted consensus step
	atNodes( tSender.iLabel ).afY =																...
			( 1 - atNodes( tSender.iLabel ).fConsensusAccelerationFactor ) * afSenderWeightedY	...
		+	(     atNodes( tSender.iLabel ).fConsensusAccelerationFactor ) * afSenderPastY;
	%
	atNodes( iReceiver ).afY =																	...
			( 1 - atNodes( iReceiver ).fConsensusAccelerationFactor ) * afReceiverWeightedY		...
		+	(     atNodes( iReceiver ).fConsensusAccelerationFactor ) * afReceiverPastY;
	%
	%
	% DEBUG
	if( atNodes( tSender.iLabel ).bPrintDebugInformation )
		%
		fCurrentSum = tSender.ComputeSumOfYs( atNodes, iReceiver );
		%
		if( fCurrentSum ~= fPreviousSum )
			%
			fprintf('p%.2f c%.2f\n', fPreviousSum, fCurrentSum );
			error('sums are not being preserved');
			%
		end;%
		%
	end;%
	%
	%
end %

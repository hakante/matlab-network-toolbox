function atNodes = CommunicateWithUsingAverageConsensus( tSender, atNodes, iReceiver )
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
	afSenderY	= atNodes( tSender.iLabel ).afY;
	afReceiverY = atNodes( iReceiver ).afY;
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
	% make the consensus step
	atNodes( tSender.iLabel ).afY =												...
			afSenderY															...
		-	atNodes( tSender.iLabel ).fConsensusWeight * round( afSenderY	 )	...
		+	atNodes( tSender.iLabel ).fConsensusWeight * round( afReceiverY );
	%
	atNodes( iReceiver ).afY =												...
			afReceiverY														...
		-	atNodes( iReceiver ).fConsensusWeight * round( afReceiverY )	...
		+	atNodes( iReceiver ).fConsensusWeight * round( afSenderY );
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
	% DEBUG
% 	if( atNodes( tSender.iLabel ).iLabel == 1 )
% 		%
% 		%
% 	end;%
	%
end %

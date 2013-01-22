function atNodes = CommunicateWith( tSender, atNodes, aiReceivers )
	%
	%
	switch( tSender.iConsensusKind )
		%
		case tSender.AVERAGE_CONSENSUS;
			%
			atNodes = tSender.CommunicateWithUsingAverageConsensus( atNodes, aiReceivers );
		%
		case tSender.ACCELERATED_AVERAGE_CONSENSUS;
			%
			atNodes = tSender.CommunicateWithUsingAcceleratedAverageConsensus( atNodes, aiReceivers );
		%
		case tSender.AVERAGE_BY_RATIOS_CONSENSUS;
			%
			atNodes = tSender.CommunicateWithUsingAverageByRatiosConsensus( atNodes, aiReceivers );
		%
		case tSender.MAX_CONSENSUS;
			%
			atNodes = tSender.CommunicateWithUsingMaxConsensus( atNodes, aiReceivers );
		%
		otherwise
			%
			disp( tSender.iConsensusKind );
			error('wrong consensus kind!');
		%
	end;%
	%
	%
% 	if( tSender.bPrintDebugInformation )
% 		%
% 		fprintf('node %d: novel y = %.5f\n', tSender.iLabel, tSender.afY(1));
% 		%
% 	end;%
% 	%
% 	if( tReceiver.bPrintDebugInformation )
% 		%
% 		fprintf('node %d: novel y = %.5f\n', tReceiver.iLabel, tReceiver.afY(1));
% 		%
% 	end;%
	%
end %

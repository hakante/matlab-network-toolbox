function atNodes = CommunicateWithUsingAverageByRatiosConsensus( tSender, atNodes, aiReceivers )
	%
	% DEBUG
	if( atNodes( tSender.iLabel ).bPrintDebugInformation )
		%
		fPreviousSum = tSender.ComputeSumOfYs( atNodes, aiReceivers );
		%
		fprintf('sender: %.4f\n', atNodes( tSender.iLabel ).afY(1));
		for iIndex = 1:numel( aiReceivers )
			iReceiverIndex = aiReceivers( iIndex );
			fprintf('receiver %d: %.4f\n', iReceiverIndex, atNodes( iReceiverIndex ).afY(1));
		end;%
		%
	end;%
	%
	%
	% make the consensus step for the sender
	atNodes( tSender.iLabel ).afY =								...
			atNodes( tSender.iLabel).afY						...
		/	( numel(atNodes(tSender.iLabel).aiNeighbors) + 1 );
	%
	atNodes( tSender.iLabel ).afAuxiliaryY =					...
			atNodes( tSender.iLabel).afAuxiliaryY				...
		/	( numel(atNodes(tSender.iLabel).aiNeighbors) + 1 );
	%
	%
	% make the consensus step for the receivers
	for iIndex = 1:numel( aiReceivers )
		%
		iReceiverIndex = aiReceivers( iIndex );
		%
		atNodes( iReceiverIndex ).afY =							...
				atNodes( iReceiverIndex ).afY					...
			+	atNodes( tSender.iLabel).afY;
		%
		atNodes( iReceiverIndex ).afAuxiliaryY =				...
				atNodes( iReceiverIndex ).afAuxiliaryY			...
			+	atNodes( tSender.iLabel).afAuxiliaryY;
		%
	end;%
	%
	%
	% DEBUG
	if( atNodes( tSender.iLabel ).bPrintDebugInformation )
		%
		fprintf('sender: %.4f\n', atNodes( tSender.iLabel ).afY(1));
		for iIndex = 1:numel( aiReceivers )
			iReceiverIndex = aiReceivers( iIndex );
			fprintf('receiver %d: %.4f\n', iReceiverIndex, atNodes( iReceiverIndex ).afY(1));
		end;%
		%
		fCurrentSum = tSender.ComputeSumOfYs( atNodes, aiReceivers );
		%
		if( (abs(fCurrentSum - fPreviousSum) / fCurrentSum) > 10^(-15) )
			%
			fprintf('previous sum = %.16f,  current sum = %.16f\n', fPreviousSum, fCurrentSum );
 			error('sums are not being preserved');
			%
		end;%
		%
	end;%
	%
	%
end %

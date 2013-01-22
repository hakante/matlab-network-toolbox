function fSum = ComputeSumOfYs( tSender, atNodes, aiReceivers )
	%
	fSum = atNodes( tSender.iLabel ).afY(1);
	%
	for iIndex = 1:numel(aiReceivers);
		%
		iReceiverIndex = aiReceivers( iIndex );
		%
		fSum = sum( fSum + atNodes( iReceiverIndex ).afY(1) );
		%
	end;%
	%
end %

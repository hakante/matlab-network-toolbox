function atNodes = CommunicateWithUsingMaxConsensus( tSender, atNodes, aiReceivers )
	%
	%
	for iIndex = 1:numel(aiReceivers)
		%
		iReceiverIndex = aiReceivers(iIndex);
		%
		atNodes( iReceiverIndex ).afY =										...
			max(atNodes( iReceiverIndex ).afY, atNodes( tSender.iLabel ).afY);
		%
	end;%
	%
	%
	% DEBUG
% 	if( tSender.iLabel == 1 )
% 		%
% 		%
% 	end;%
	%
end %

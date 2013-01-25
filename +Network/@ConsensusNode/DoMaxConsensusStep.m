function atNodes = DoMaxConsensusStep( tSender, atNodes, aiReceivers )
	%
	for iIndex = 1:numel(aiReceivers)
		%
		iReceiverIndex = aiReceivers(iIndex);
		%
		atNodes( iReceiverIndex ).afConsensusVector =			...
			max(atNodes( iReceiverIndex ).afConsensusVector,	...
				atNodes( tSender.iLabel ).afConsensusVector		);
		%
	end;%
	%
end %

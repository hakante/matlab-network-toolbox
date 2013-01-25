function atNodes = DoHadjacostisConsensusStep( tSender, atNodes, aiReceivers )
	%
	% DEBUG
% 	fPreviousSum = Network.ConsensusNode.GetConsensusVectorsSum( atNodes );
	%
	%
	% make the consensus step for the sender
	atNodes( tSender.iLabel ).afAuxiliaryConsensusVectorA =			...
			atNodes( tSender.iLabel ).afAuxiliaryConsensusVectorA	...
		/	( numel( aiReceivers ) + 1 );
	%
	atNodes( tSender.iLabel ).afAuxiliaryConsensusVectorB =			...
			atNodes( tSender.iLabel ).afAuxiliaryConsensusVectorB	...
		/	( numel( aiReceivers ) + 1 );
	%
	atNodes( tSender.iLabel ).afConsensusVector =					...
			atNodes( tSender.iLabel ).afAuxiliaryConsensusVectorA	...
		./	atNodes( tSender.iLabel ).afAuxiliaryConsensusVectorB;
	%
	% make the consensus step for the receivers
	for iIndex = 1:numel( aiReceivers )
		%
		iReceiverIndex = aiReceivers( iIndex );
		%
		atNodes( iReceiverIndex ).afAuxiliaryConsensusVectorA =			...
				atNodes( iReceiverIndex ).afAuxiliaryConsensusVectorA	...
			+	atNodes( tSender.iLabel ).afAuxiliaryConsensusVectorA;
		%
		atNodes( iReceiverIndex ).afAuxiliaryConsensusVectorB =			...
				atNodes( iReceiverIndex ).afAuxiliaryConsensusVectorB	...
			+	atNodes( tSender.iLabel ).afAuxiliaryConsensusVectorB;
		%
		atNodes( iReceiverIndex ).afConsensusVector =					...
				atNodes( iReceiverIndex ).afAuxiliaryConsensusVectorA	...
			./	atNodes( iReceiverIndex ).afAuxiliaryConsensusVectorB;
		%
	end;%
	%
	%
	% DEBUG
% 	fCurrentSum = Network.ConsensusNode.GetConsensusVectorsSum( atNodes );
% 	if( fCurrentSum ~= fPreviousSum )
% 		fprintf('p%.2f c%.2f\n', fPreviousSum, fCurrentSum );
% 		error('sums are not being preserved');
% 	end;%
	%
end %

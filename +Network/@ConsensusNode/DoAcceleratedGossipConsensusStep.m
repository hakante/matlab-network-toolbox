function atNodes = DoAcceleratedGossipConsensusStep( tSender, atNodes, iReceiver )
	%
	% DEBUG
% 	fPreviousSum = Network.ConsensusNode.GetConsensusVectorsSum( atNodes );
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
	afSenderCurrentY	= atNodes( tSender.iLabel ).afConsensusVector;
	afReceiverCurrentY	= atNodes( iReceiver ).afConsensusVector;
	%
	afSenderPastY		= atNodes( tSender.iLabel ).afAuxiliaryConsensusVectorA;
	afReceiverPastY		= atNodes( iReceiver ).afAuxiliaryConsensusVectorA;
	%
	%
	% make the weighted consensus step
	afSenderWeightedY =															...
			afSenderCurrentY													...
		-	atNodes( tSender.iLabel ).fGossipWeight * round( afSenderCurrentY )	...
		+	atNodes( tSender.iLabel ).fGossipWeight * round( afReceiverCurrentY );
	%
	afReceiverWeightedY =														...
			afReceiverCurrentY													...
		-	atNodes( iReceiver ).fGossipWeight * round( afReceiverCurrentY )	...
		+	atNodes( iReceiver ).fGossipWeight * round( afSenderCurrentY );
	%
	%
	% save the past values
	atNodes( tSender.iLabel ).afAuxiliaryConsensusVectorA	= atNodes( tSender.iLabel ).afConsensusVector;
	atNodes( iReceiver ).afAuxiliaryConsensusVectorA		= atNodes( iReceiver ).afConsensusVector;
	%
	%
	% weight with the forecasted consensus step
	atNodes( tSender.iLabel ).afConsensusVector =																...
			( 1 - atNodes( tSender.iLabel ).fAcceleratedGossipWeight ) * afSenderWeightedY	...
		+	(     atNodes( tSender.iLabel ).fAcceleratedGossipWeight ) * afSenderPastY;
	%
	atNodes( iReceiver ).afConsensusVector =																	...
			( 1 - atNodes( iReceiver ).fAcceleratedGossipWeight ) * afReceiverWeightedY		...
		+	(     atNodes( iReceiver ).fAcceleratedGossipWeight ) * afReceiverPastY;
	%
	%
	% DEBUG
% 	fCurrentSum = Network.ConsensusNode.GetConsensusVectorsSum( atNodes );
% 	if( fCurrentSum ~= fPreviousSum )
% 		fprintf('p%.2f c%.2f\n', fPreviousSum, fCurrentSum );
% 		error('sums are not being preserved');
% 	end;%
	%
	%
end %

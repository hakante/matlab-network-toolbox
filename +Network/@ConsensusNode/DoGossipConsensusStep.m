function atNodes = DoGossipConsensusStep( tSender, atNodes, iReceiver )
	%
	% DEBUG
% 	fPreviousSum = Network.ConsensusNode.GetConsensusVectorsSum( atNodes );
	%
	%
	% consistency check
	if( numel( iReceiver ) ~= 1 )
		%
		error('wrong number of receivers (check how bUseBroadcastCommunications is set!!)');
		%
	end;%
	%
	% temporary variables
	afSenderVector		= atNodes( tSender.iLabel ).afConsensusVector;
	afReceiverVector	= atNodes( iReceiver ).afConsensusVector;
	%
	% make the consensus step
	atNodes( tSender.iLabel ).afConsensusVector =									...
			afSenderVector															...
		-	atNodes( tSender.iLabel ).fGossipWeight * round( afSenderVector	 )	...
		+	atNodes( tSender.iLabel ).fGossipWeight * round( afReceiverVector );
	%
	atNodes( iReceiver ).afConsensusVector =										...
			afReceiverVector														...
		-	atNodes( iReceiver ).fGossipWeight * round( afReceiverVector )		...
		+	atNodes( iReceiver ).fGossipWeight * round( afSenderVector );
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

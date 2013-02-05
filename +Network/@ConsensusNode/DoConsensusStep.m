function atNodes = DoConsensusStep( tSender, atNodes, aiReceivers )
	%
	switch( tSender.iConsensusKind )
		%
		case tSender.GOSSIP;
			%
			atNodes = tSender.DoGossipConsensusStep( atNodes, aiReceivers );
		%
		case tSender.ACCELERATED_GOSSIP;
			%
			atNodes = tSender.DoAcceleratedGossipConsensusStep( atNodes, aiReceivers );
		%
		case tSender.HADJICOSTIS;
			%
			atNodes = tSender.DoHadjicostisConsensusStep( atNodes, aiReceivers );
		%
		case tSender.MAX;
			%
			atNodes = tSender.DoMaxConsensusStep( atNodes, aiReceivers );
		%
		otherwise
			%
			disp( tSender.iConsensusKind );
			error('wrong consensus kind!');
		%
	end;%
	%
end %

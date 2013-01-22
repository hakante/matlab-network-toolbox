function UpdateActivationsCounters( tNetwork, iSender, iReceiver, fCurrentTime )
	%
	tNetwork.UpdateNodeActivationsCounter( iSender, fCurrentTime );
	%
	% update for the receiver only if actually there is a receiver
	if( iReceiver > 0 )
		%
		tNetwork.UpdateLinkActivationsCounter( iSender, iReceiver, fCurrentTime );
		%
	end;%
	%
end %

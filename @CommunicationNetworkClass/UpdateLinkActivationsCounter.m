function UpdateLinkActivationsCounter( tNetwork, iSender, iReceiver, fCurrentTime )
	%
	% update only if meaningful
	if( iSender > 0 && iReceiver > 0 )
		%
		tNetwork.aaiActivatingLinksCounters(iSender, iReceiver) = ...
			tNetwork.aaiActivatingLinksCounters(iSender, iReceiver) + 1;
		%
		tNetwork.aafActivatingLinksTimers(iSender, iReceiver) = fCurrentTime;
		%
		% update also the other link if the communications are undirected
		if( strcmp( tNetwork.strCommunicationKind, 'undirected' ) )
			%
			tNetwork.aaiActivatingLinksCounters(iReceiver, iSender) = ...
				tNetwork.aaiActivatingLinksCounters(iReceiver, iSender) + 1;
			%
			tNetwork.aafActivatingLinksTimers(iReceiver, iSender) = fCurrentTime;
			%
		end;%
		%
	end;%
	%
end %

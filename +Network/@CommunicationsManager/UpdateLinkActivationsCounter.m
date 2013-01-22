function UpdateLinkActivationsCounter( tCommunicationsManager, iSender, iReceiver, fCurrentTime )
	%
	% update only if meaningful
	if( iSender > 0 && iReceiver > 0 )
		%
		tCommunicationsManager.aaiActivatingLinksCounters(iSender, iReceiver) = ...
			tCommunicationsManager.aaiActivatingLinksCounters(iSender, iReceiver) + 1;
		%
		tCommunicationsManager.aafActivatingLinksTimers(iSender, iReceiver) = fCurrentTime;
		%
		% update also the other link if the communications are undirected
		if( strcmp( tCommunicationsManager.strCommunicationKind, 'undirected' ) )
			%
			tCommunicationsManager.aaiActivatingLinksCounters(iReceiver, iSender) = ...
				tCommunicationsManager.aaiActivatingLinksCounters(iReceiver, iSender) + 1;
			%
			tCommunicationsManager.aafActivatingLinksTimers(iReceiver, iSender) = fCurrentTime;
			%
		end;%
		%
	end;%
	%
end %

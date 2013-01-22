function [iSender, iReceiver] = ExtractLink( tCommunicationsManager, iCurrentTime )
	%
	if( tCommunicationsManager.bLoadFromFile )
		%
		iSender		= tCommunicationsManager.aiListOfSendersFromFile( iCurrentTime );
		iReceiver	= cell2mat(tCommunicationsManager.aacListOfReceiversFromFile{ iCurrentTime });
		%
		% TODO
		if( numel( iReceiver ) ~= 1 )
			%
			error('multicast still not supported, sorry :(');
			%
		end;%
		%
		% update the counters
		tCommunicationsManager.UpdateLinkActivationsCounter( iSender, iReceiver, iCurrentTime );
		%
	else%
		%
		[iSender, iReceiver] = tCommunicationsManager.ExtractRandomLink( iCurrentTime );
		%
	end;%
	%
end %

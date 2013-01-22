function [iSender, iReceiver] = ExtractLink( tNetwork, iCurrentTime )
	%
	if( tNetwork.bLoadFromFile )
		%
		iSender		= tNetwork.aiListOfSendersFromFile( iCurrentTime );
		iReceiver	= cell2mat(tNetwork.aacListOfReceiversFromFile{ iCurrentTime });
		%
		% TODO
		if( numel( iReceiver ) ~= 1 )
			%
			error('multicast still not supported, sorry :(');
			%
		end;%
		%
		% update the counters
		tNetwork.UpdateLinkActivationsCounter( iSender, iReceiver, iCurrentTime );
		%
	else%
		%
		[iSender, iReceiver] = tNetwork.ExtractRandomLink( iCurrentTime );
		%
	end;%
	%
end %

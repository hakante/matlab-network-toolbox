function iNode = ExtractNode( tCommunicationsManager )
	%
	if( tCommunicationsManager.bLoadFromFile )
		%
		% check if the current desired time exists in the file
		if(		tCommunicationsManager.iCurrentTime						...
			>	numel( tCommunicationsManager.aiListOfSendersFromFile ) )
			%
			error('the file containing the communication protocol has fewer communication steps than the ones required in LoadParameters() -- change the value!');
			%
		else%
			%
			% here the current desired time exists, thus load it
			iNode = tCommunicationsManager.aiListOfSendersFromFile( tCommunicationsManager.iCurrentTime );
			%
			% then update the counters
			tCommunicationsManager.UpdateNodeActivationsCounter( iNode );
			%
		end;%
		%
	else%
		%
		iNode = tCommunicationsManager.ExtractRandomNode();
		%
	end;%
	%
end %

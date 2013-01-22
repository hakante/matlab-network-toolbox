function iNode = ExtractNode( tCommunicationsManager, iCurrentTime )
	%
	if( tCommunicationsManager.bLoadFromFile )
		%
		% check if the current desired time exists in the file
		if( iCurrentTime > numel(tCommunicationsManager.aiListOfSendersFromFile) )
			%
			error('the file containing the communication protocol has fewer communication steps than the ones required in LoadParameters() -- change the value!');
			%
		else%
			%
			% here the current desired time exists, thus load it
			iNode = tCommunicationsManager.aiListOfSendersFromFile( iCurrentTime );
			%
			% then update the counters
			tCommunicationsManager.UpdateNodeActivationsCounter( iNode, iCurrentTime );
			%
		end;%
		%
	else%
		%
		iNode = tCommunicationsManager.ExtractRandomNode( iCurrentTime );
		%
	end;%
	%
end %

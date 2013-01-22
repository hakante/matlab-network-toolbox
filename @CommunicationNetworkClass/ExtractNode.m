function iNode = ExtractNode( tNetwork, iCurrentTime )
	%
	if( tNetwork.bLoadFromFile )
		%
		% check if the current desired time exists in the file
		if( iCurrentTime > numel(tNetwork.aiListOfSendersFromFile) )
			%
			error('the file containing the communication protocol has fewer communication steps than the ones required in LoadParameters() -- change the value!');
			%
		else%
			%
			% here the current desired time exists, thus load it
			iNode = tNetwork.aiListOfSendersFromFile( iCurrentTime );
			%
			% then update the counters
			tNetwork.UpdateNodeActivationsCounter( iNode, iCurrentTime );
			%
		end;%
		%
	else%
		%
		iNode = tNetwork.ExtractRandomNode( iCurrentTime );
		%
	end;%
	%
end %

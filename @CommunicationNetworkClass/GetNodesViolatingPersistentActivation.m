function aiViolatingNodes = GetNodesViolatingPersistentActivation( tNetwork, fCurrentTime )
	%
	if( tNetwork.bForcePersistentActivationOfNodes )
		%
		% find all the labels
		aiViolatingNodes =												...
			(															...
				( fCurrentTime - tNetwork.afActivatingNodesTimers )	...
				>														...
				tNetwork.fIntervalOfPersistentActivationOfNodes			...
			)															...
			.* (1:tNetwork.iNumberOfNodes)';
		%
		% remove the zeros
		aiViolatingNodes = aiViolatingNodes( aiViolatingNodes ~= 0 );
		%
	else%
		%
		aiViolatingNodes = [];
		%
	end;%
	%
	%
	if( sum(aiViolatingNodes) > 0 )
		%
		tNetwork.iPersistentActivationOfNodesViolationsCounter = ...
			tNetwork.iPersistentActivationOfNodesViolationsCounter + 1;
		%
	end;%
	%
end %

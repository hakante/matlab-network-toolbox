function aabViolatingLinks = GetLinksViolatingPersistentActivation( tNetwork, fCurrentTime )
	%
	if( tNetwork.bForcePersistentActivationOfLinks )
		%
		% find all the labels
		aabViolatingLinks =												...
			(															...
				( fCurrentTime - tNetwork.aafActivatingLinksTimers )	...
				>														...
				tNetwork.fIntervalOfPersistentActivationOfLinks			...
			)															...
			.*															...
			tNetwork.aaiAdjacencyMatrix;
		%
	else%
		%
		aabViolatingLinks = zeros( size( tNetwork.aaiAdjacencyMatrix ) );
		%
	end;%
	%
	%
	if( sum(sum(aabViolatingLinks)) > 0 )
		%
		tNetwork.iPersistentActivationOfLinksViolationsCounter = ...
			tNetwork.iPersistentActivationOfLinksViolationsCounter + 1;
		%
	end;%
	%
end %

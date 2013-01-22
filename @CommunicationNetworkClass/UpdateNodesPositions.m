function UpdateNodesPositions( tNetwork, aafNewPositions )
	%
	tNetwork.aafNodesPositions = aafNewPositions;
	%
	if( strcmp(tNetwork.strKindOfGraph, 'random geometric' ) )
		%
		tNetwork.UpdateRandomGeometricLinks();
		%
		if( ~tNetwork.IsConnected() )
			%
			fprintf('WARNING: the network is disconnected\n');
			%
		end;%
		%
	end;%
	%
end %

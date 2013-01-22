% Algorithm: generates some nodes on the [0 1] X [0 1] plane and then connect
% them if they are sufficiently close
%
% will always return a connected graph (it has a connectedness checking)
%
function GenerateRandomGeometricGraph( tNetwork )
	%
	% flag for checking the connectedness
	bIsConnected			= false;
	iNonConnectionsCounter	= 0;
	%
	% until the graph is not connected generate an other one
	while( ~bIsConnected )
		%
		iNonConnectionsCounter = iNonConnectionsCounter + 1;
		%
		if( iNonConnectionsCounter > 20 )
			%
			error('communication radius too small to have a connected graph => increase it');
			%
		end;%
		%
		% generate the nodes -- it updates also the geometric links
		tNetwork.UpdateNodesPositions( rand( tNetwork.iNumberOfNodes, 2 ) );
		%
		% check if it is connected
		bIsConnected = tNetwork.IsConnected();
		%
	end;%
	%
end %

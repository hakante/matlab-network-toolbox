% Algorithm: raise the adjacency matrix up to the moment where it has no
% zero elements
%
function ComputeDiameter( tNetwork )
	%
	% initialization of the algorithm
	bThereIsAZero					= true;
	tNetwork.iDiameter				= 0;
	aaiRaisedAdjacencyMatrix		= eye( tNetwork.iNumberOfNodes );
	aaiSelfLoopedAdjacencyMatrix	= tNetwork.GetSelfLoopedAdjacencyMatrix();
	%
	while( bThereIsAZero )
		%
		tNetwork.iDiameter			= tNetwork.iDiameter + 1;
		aaiRaisedAdjacencyMatrix	= aaiRaisedAdjacencyMatrix * aaiSelfLoopedAdjacencyMatrix;
		%
% 		% DEBUG
%  		fprintf('Diameter computation: trying d = %d\n', tNetwork.iDiameter);
		if( sum( aaiRaisedAdjacencyMatrix(:) == zeros(tNetwork.iNumberOfNodes^2, 1) ) == 0 )
			%
			bThereIsAZero = false;
			%
		end;%
		%
		if( tNetwork.iDiameter > tNetwork.iNumberOfNodes )
			%
			tNetwork.iDiameter = -1;
			fprintf('WARNING: there is more than one connected components (warning from "ComputeDiameter()")\n');
			return;
			%
		end;%
		%
	end;%
	%
	% DEBUG
% 	fprintf('Diameter computation: true d = %d\n', iDiameter);
	%
end %

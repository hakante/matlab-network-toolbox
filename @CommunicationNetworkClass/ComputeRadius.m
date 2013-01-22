% Algorithm: raise the adjacency matrix up to the moment where it has no
% zero elements
%
function ComputeRadius( tNetwork )
	%
	% initialization of the algorithm
	bEveryRowHasAZero				= true;
	tNetwork.iRadius				= 0;
	aaiRaisedAdjacencyMatrix		= eye( tNetwork.iNumberOfNodes );
	aaiSelfLoopedAdjacencyMatrix	= tNetwork.GetSelfLoopedAdjacencyMatrix();
	%
	while( bEveryRowHasAZero )
		%
		tNetwork.iRadius			= tNetwork.iRadius + 1;
		aaiRaisedAdjacencyMatrix	= aaiRaisedAdjacencyMatrix * aaiSelfLoopedAdjacencyMatrix;
		%
% 		% DEBUG
%  		fprintf('Radius computation: trying d = %d\n', tNetwork.iRadius);
		for iRow = 1:tNetwork.iNumberOfNodes;
			%
			if( sum( aaiRaisedAdjacencyMatrix(iRow, :) == zeros(1, tNetwork.iNumberOfNodes) ) == 0 )
				%
				bEveryRowHasAZero = false;
				%
			end;%
			%
		end;%
		%
		if( tNetwork.iRadius > tNetwork.iNumberOfNodes )
			%
			tNetwork.iRadius = -1;
			fprintf('WARNING: there is more than one connected components (warning from "ComputeRadius()")\n');
			return;
			%
		end;%
		%
	end;%
	%
	% DEBUG
% 	fprintf('Radius computation: true d = %d\n', tNetwork.iRadius);
	%
end %

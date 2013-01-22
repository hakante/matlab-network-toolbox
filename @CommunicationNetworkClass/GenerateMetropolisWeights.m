function aafWeights = GenerateMetropolisWeights( tNetwork )
	%
	% storage allocation
	aafWeights = zeros( tNetwork.iNumberOfNodes, tNetwork.iNumberOfNodes );
	%
	%
	% compute the degrees of the nodes
	aiNodesDegrees = zeros( tNetwork.iNumberOfNodes, 1 );
	%
	for iNode = 1:tNetwork.iNumberOfNodes;
		%
		bUseSelfloops = false;
		aiNodesDegrees(iNode) = numel( tNetwork.GetNeighborsOfNode(iNode, bUseSelfloops) );
		%
	end;%
	%
	%
	% compute the Metropolis weights - first pass, do not consider the
	% self-loops weights
	for iNodeA = 1:tNetwork.iNumberOfNodes;
	for iNodeB = 1:tNetwork.iNumberOfNodes;
		%
		if( iNodeA ~= iNodeB )
			%
			% case the nodes are neighbors
			if( tNetwork.AreNodesNeighbors( iNodeA, iNodeB ) )
				%
				aafWeights(iNodeA, iNodeB) =									...
					1															...
					/															...
					( 1 + max( aiNodesDegrees(iNodeA), aiNodesDegrees(iNodeB) ) );
				%
			end;%
			%
		end;%
		%
	end;%
	end;%
	%
	%
	% compute the Metropolis weights - second pass, do not consider the
	% self-loops weights
	for iNodeA = 1:tNetwork.iNumberOfNodes;
		%
		fSum = 1;
		%
		for iNodeB = 1:tNetwork.iNumberOfNodes;
			%
			if	(													...
					( iNodeA ~= iNodeB )							...
					&&												...
					tNetwork.AreNodesNeighbors( iNodeA, iNodeB )	...
				)
				%
				fSum = fSum - aafWeights(iNodeA, iNodeB);
				%
			end;%
			%
		end;%
		%
		aafWeights(iNodeA, iNodeA) = fSum;
		%
	end;%
	%
	%
	if( tNetwork.bPrintDebugInformation )
		%
		fprintf('\nChecking whether Metropolis weights have been computed correctly:\n');
		disp(aafWeights * ones(tNetwork.iNumberOfNodes, 1))
		disp(ones(1, tNetwork.iNumberOfNodes) * aafWeights)
		%
	end;%
	%
end %

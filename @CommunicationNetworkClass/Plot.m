function Plot( tNetwork )
	%
	% for readability
	iNumberOfNodes = numel(tNetwork.aaiAdjacencyMatrix(1,:));
	%
	figure(86341324);
	refresh(86341324);
	scatter(tNetwork.aafNodesPositions(:,1), tNetwork.aafNodesPositions(:,2));
	axis equal;
	title('communication graph');
	%
	hold on;
	%
	for iNodeA = 1:iNumberOfNodes;
		%
		for iNodeB = (iNodeA+1):iNumberOfNodes;
			%
			% if they are connected then draw the link
			if(  tNetwork.aaiAdjacencyMatrix(iNodeA, iNodeB) ~= 0  )
				%
				line(	[tNetwork.aafNodesPositions(iNodeA, 1), tNetwork.aafNodesPositions(iNodeB, 1)],	...
						[tNetwork.aafNodesPositions(iNodeA, 2), tNetwork.aafNodesPositions(iNodeB, 2)]	);
				%
			end;%
			%
		end;%
		%
	end;%
	%
	hold off;
	%
end %

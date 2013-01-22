function tNode = SetNeighbors( tNode, tNetwork )
	%
	tNode.aiNeighbors = tNetwork.GetNeighborsOfNode( tNode.iLabel, false );
	%
end %

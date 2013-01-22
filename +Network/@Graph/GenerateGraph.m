function GenerateGraph( tGraph )
	%
	switch tGraph.strKindOfGraph
		%
		case 'line'
			tGraph.GenerateLineGraph();
		%
		case 'cycle'
			tGraph.GenerateCycleGraph();
		%
		case 'random geometric'
			tGraph.GenerateRandomGeometricGraph();
		%
		case 'bidimensional grid'
			tGraph.GenerateBidimensionalGridGraph();
		%
		otherwise
			disp(tGraph.strKindOfGraph);
			error('Not supported kind of graph');
		%
	end;%
	%
end %

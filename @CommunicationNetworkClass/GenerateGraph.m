function GenerateGraph( tNetwork )
	%
	switch tNetwork.strKindOfGraph
		%
		case 'line'
			tNetwork.GenerateLineGraph();
		%
		case 'cycle'
			tNetwork.GenerateCycleGraph();
		%
		case 'random geometric'
			tNetwork.GenerateRandomGeometricGraph();
		%
		case 'bidimensional grid'
			tNetwork.GenerateBidimensionalGridGraph();
		%
		otherwise
			disp(tNetwork.strKindOfGraph);
			error('Not supported kind of graph');
		%
	end;%
	%
end %

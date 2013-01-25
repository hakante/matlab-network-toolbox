function tNode = SetConsensusKind(	tNode,				...
									strConsensusKind,	...
									varargin			)
	%
	afVarargin = cell2mat(varargin{1});
	%
	switch( strConsensusKind )
		%
		case 'gossip'
			%
			tNode.iConsensusKind			= tNode.GOSSIP;
			tNode.fGossipWeight				= afVarargin(1);
		%
		case 'accelerated gossip'
			%
			tNode.iConsensusKind			= tNode.ACCELERATED_GOSSIP;
			tNode.fGossipWeight				= afVarargin(1);
			tNode.fAcceleratedGossipWeight	= afVarargin(2);
		%
		case 'hadjacostis'
			%
			tNode.iConsensusKind			= tNode.HADJACOSTIS;
		%
		case 'max'
			%
			tNode.iConsensusKind			= tNode.MAX;
		%
		otherwise
			%
			disp(strConsensusKind);
			error('wrong consensus kind selection!');
		%
	end;%
	%
end %

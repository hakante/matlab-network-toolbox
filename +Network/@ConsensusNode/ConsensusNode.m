classdef ConsensusNode
	%
	properties
		%
		iLabel;
		%
		afConsensusVector;
		afAuxiliaryConsensusVectorA;	% accelerated consensus = memory of the past consensus step
		% -----------------------------	% hadjicostis consensus = initialized to the consensus vector
		afAuxiliaryConsensusVectorB;	% hadjicostis consensus = initialized to ones, useful to find the eigenvector associated to the 2 largest eigenvalue of the laplacian matrix
		%
		iNumberOfElements;
		iNumberOfBits;				% for quantization purposes
		aiQuantizedDomain;			% NOTE: the quantized domain is a set of integers -- TODO make it more general
		%
		iConsensusKind;				% see the labels below
		iLocalGenerationKind;		% see the labels below
		fGossipWeight;
		fAcceleratedGossipWeight;
		%
		% consensus kinds
		GOSSIP;
		ACCELERATED_GOSSIP;
		HADJICOSTIS;
		MAX;
		%
		% local generation kinds
		DETERMINISTIC;
		GAUSSIAN;
		UNIFORM;
		BERNOULLI_MULTI_BITS;
		BERNOULLI_SINGLE_BITS;
		%
	end %
	%
	%
	methods
		%
		% standard constructor
		function tNode = ConsensusNode(	iLabel,					...
										iNumberOfElements,		...
										iNumberOfBits,			...
										strLocalGenerationKind,	... 'deterministic' | 'gaussian' | 'uniform' | 'bernoulli multi-bits' | 'bernoulli single-bits'
										strConsensusKind,		... 'gossip' | 'accelerated gossip' | 'hadjicostis' | 'max'
										varargin				)
										%
										% 'gossip':
										% varargin{1} = gossip weight
										%
										% 'accelerated gossip':
										% varargin{1} = gossip weight
										% varargin{2} = memory weight
										% 
										% 'deterministic':
										% varargin{end} = initial local value
		if( nargin > 0 ) % (for instantiation of arrays)
			%
			% set the labels
			tNode = tNode.SetLabels( iLabel );
			%
			% set the kind of consensus and of local generation
			tNode = tNode.SetConsensusKind( strConsensusKind, varargin );
			tNode = tNode.SetLocalGenerationKind( strLocalGenerationKind );
			%
			% now we can set up the quantization properties
			tNode = tNode.InitializeQuantizer( iNumberOfBits );
			%
			% initialize the random vectors
			tNode = tNode.InitializeConsensusVector( iNumberOfElements, varargin );
			%
		end;% nargin > 0 (for instantiation of arrays)
		end %
		%
	end %
	%
	%
	methods (Static = true)
		%
		fDissensus	= DissensusOf( atNodes );
		fSum		= GetConsensusVectorsSum( atNodes );
		%
	end	%
	%
	%
end %

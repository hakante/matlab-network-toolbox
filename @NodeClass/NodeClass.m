classdef NodeClass
	%
	% ---------------------------------------------------------------------
	properties
		%
		bPrintDebugInformation;
		%
		iLabel;
		%
		afY;
		afAuxiliaryY;				% for accelerated consensus
		%
		iNumberOfTrials;
		iNumberOfBits;				% for quantization purposes
		aiQuantizedDomain;			% NOTE: the quantized domain is a set of integers -- TODO make it more general
		%
		iConsensusKind;				% see the labels below
		iLocalGenerationKind;		% see the labels below
		fConsensusWeight;
		fConsensusAccelerationFactor;
		%
		fLocalGuess;
		%
		aiNeighbors;
		%
		tBernoulliMultibitsEstimator;
		%
		% consensus kinds
		AVERAGE_CONSENSUS;
		ACCELERATED_AVERAGE_CONSENSUS;
		AVERAGE_BY_RATIOS_CONSENSUS;
		MAX_CONSENSUS;
		%
		% local generation kinds
		GAUSSIAN;
		UNIFORM;
		BERNOULLI_MULTI_BITS;
		BERNOULLI_SINGLE_BITS;
		%
	end %
	%
	%
	% ---------------------------------------------------------------------
	methods
		%
		% standard constructor
		function tNode = NodeClass( tParameters, tNetwork, iLabel )
		if( nargin > 0 ) % (for instantiation of arrays)
			%
			% set the labels
			tNode = tNode.SetLabels();
			%
			% set the internal parameters
			tNode.bPrintDebugInformation	= tParameters.bPrintDebugInformation;
			tNode.iLabel					= iLabel;
			tNode.iNumberOfTrials			= tParameters.iNumberOfTrials;
			tNode.iNumberOfBits				= tParameters.iNumberOfBits;
			%
			% set the neighbors
			tNode = tNode.SetNeighbors( tNetwork );
			%
			% set the kind of consensus and of local generation; in case
			% allocate the bernoulli multibits estimator
			tNode = tNode.SetConsensusKind( tParameters );
			tNode = tNode.SetLocalGenerationKind( tParameters );
			%
			% now we can set up the quantization properties
			tNode = tNode.InitializeQuantizer();
			%
			% initialize the random vectors
			tNode = tNode.InitializeY();
			%
			% initialize the estimate
			tNode = tNode.UpdateLocalGuess();
			%
			fprintf('Node %d succesfully constructed\n', tNode.iLabel);
			%
			if( tNode.bPrintDebugInformation )
				%
				tNode.Print();
				%
			end;%
			%
		end;% nargin > 0 (for instantiation of arrays)
		end %
		%
	end %
	%
	%
end %

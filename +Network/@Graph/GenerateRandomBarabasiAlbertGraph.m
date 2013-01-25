function g = GenerateRandomBarabasiAlbertGraph( N, outDegree, isDirected )

    if nargin == 0 || ~isscalar(N) || N<1
        error('Invalid graph size given');
    end
    if nargin < 3
        isDirected = false;
    end
    if outDegree >= N
        error('Degree must be less than number of nodes');
    end
    
    % Construct graph
    g = Network.Graph();
    g.name = 'Preferential Attachment Random Graph';
    g.isDirected = isDirected;
    
    adjacencyMatrix = false(N);
    % Create a complete directed graph for the first 'outDegree' nodes.
    adjacencyMatrix(1:outDegree, 1:outDegree) = triu(true(outDegree),1);
    
    for node = outDegree+1:N
        degreeDistribution = sum(adjacencyMatrix(1:node-1,1:node-1),2)+sum(adjacencyMatrix(1:node-1,1:node-1),1)';
        if degreeDistribution(1)==0
            degreeDistribution(1) = 1; % If the out degree is 1, and this is the first edge.
        end
        nodeIds = 1:node-1;
        for edge = 1:outDegree
           sample = randsample(length(nodeIds), 1, true, degreeDistribution);
           % Create edge
           adjacencyMatrix(node, nodeIds(sample)) = true;
           % Prevent multiedges
           nodeIds(sample) = [];
           degreeDistribution(sample) = [];
        end
    end
    
    g.adjacencyMatrix = adjacencyMatrix;
    
end

classdef Graph < hgsetget
	properties(AbortSet = true)
		name;
        % nodeProperty;
        % edgeProperty;
        xNodeCoordinates;
        yNodeCoordinates;
    end
    
    properties(SetAccess=private)
        numberOfNodes;
        numberOfEdges;
    end
    
    properties(Dependent = true)
        adjacencyList;
		adjacencyMatrix;
        isDirected;
    end
    
    % Actual data store for dependent properties
    properties(Access=private)
        pAdjacencyMatrix;
        pIsDirected = true;
    end
    
    % Protected default constructor, called from generators
    methods(Access=protected)
		function g = Graph()
            g.name = 'Unknown Graph';
        end
    end
    
    % Graph generators
    methods(Static)
        g = GenerateEmptyGraph( N );
        g = GenerateCompleteGraph( N );
        g = GenerateCycleGraph( N, isDirected );
        g = GenerateLineGraph( N, isDirected );
        g = Generate2DGridGraph(Nr, Nc, isCyclic);
        g = Generate3DGridGraph(N1, N2, N3, isCyclic);
        g = GenerateDeBruijnGraph( N, M );
        g = GenerateRandomGeometricGraph( N, distance, ensureConnected );
        g = GenerateRandomErdosRenyiGraph( N, probability, isDirected );
        g = GenerateRandomBarabasiAlbertGraph( N, outDegree, isDirected );
    end
    
    % Setter and Getter methods
    methods
        function g = set.isDirected(g,val)
            disp('In set.isDirected');
            if ~isscalar(val)
                error('Value is not a scalar');
            end
            g.pIsDirected = logical(val);
            if ~g.isDirected
                g.pAdjacencyMatrix = g.pAdjacencyMatrix | g.pAdjacencyMatrix';
                g.numberOfEdges = nnz(triu(g.pAdjacencyMatrix));
            else
                g.numberOfEdges = nnz(g.adjacencyMatrix);
            end
        end
        
        function b = get.isDirected(g)
            b = g.pIsDirected;
        end
        
        function g = set.adjacencyMatrix(g,val)
            [N1, N2] = size(val);
            if ~ismatrix(val) || (N1 ~= N2)
                error('Adjacency matrix must be a square matrix');
            end
            disp('In set.adjacencyMatrix');
            g.pAdjacencyMatrix = logical(val);
            if ~g.isDirected
                g.pAdjacencyMatrix = g.pAdjacencyMatrix | g.pAdjacencyMatrix';
                g.numberOfEdges = nnz(triu(g.pAdjacencyMatrix));
            else
                g.numberOfEdges = nnz(g.adjacencyMatrix);
            end
            g.numberOfNodes = N1;
        end
        
        function matrix = get.adjacencyMatrix(g)
            matrix = g.pAdjacencyMatrix;
        end
        
        function list = get.adjacencyList(g)
            [row,col] = find(g.pAdjacencyMatrix);
            list = [row,col];
        end
    end
end
 

% An N-dimensional De Bruijn graph of M symbols is a directed graph
% representing overlaps between sequences of symbols. It has M^N vertices,
% consisting of all possible length-N sequences of the given symbols.
function g = GenerateDeBruijnGraph( N, M )
    
    % Construct graph
    g = Network.Graph();
    g.name = 'De Bruijn Graph';
    adjacencyMatrix = false(M^N);
    
    for i = 1:M^N
        seq = toWordSequence(i,N,M);
        seq(1)=[];
        for m = 1:M
            adjacencyMatrix(i, toIndexNumber([seq, m], N, M)) = true;
        end
    end
    
    g.adjacencyMatrix = adjacencyMatrix;
    
end


function seq = toWordSequence(index, N, M)
    seq = zeros(N, 1);
    for n = 1:N
        seq(N+1-n) = mod(index, M);
        index = floor(index/M);
    end
end


function index = toIndexNumber(seq, N, M)
    index = 0;
    for n=1:N
        index = index*M + seq(n);
    end
end
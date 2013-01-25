function g = Generate2DGridGraph(Nr, Nc, isCyclic)
    % Nodes 1:Nc, Nc+1:Nc*2, ..., (Nr-1)*Nc+1:Nr*Nc
    % Node i is then connected to i-1, i+1, i-Nc, i+Nc if valid
    %
    %  1  2  3  4  5
    %  6  7  8  9 10
    % 11 12 13 14 15

    if nargin < 3
        isCyclic = false;
    end
    
    g = Network.Graph();
    g.isDirected = false;

    N = Nr*Nc;
    % Edges between columns
    A1 = 1:N;
    B1 = A1-1;
    % Edges between rows
    A2 = 1:N;
    B2 = A2-Nc;
    
    firstColumnIndex = mod(A1,Nc)==1;
    firstRowIndex = 1:Nc;
    
    if isCyclic
        g.name = 'Cyclic 2D Grid Graph';
       
        % Connect first column to last column
        B1(firstColumnIndex) = B1(firstColumnIndex)+Nc;
        % Connect first row to last row
        B2(firstRowIndex) = B2(firstRowIndex) + N;

    else
        g.name = '2D Grid Graph';

        % Remove edges from first column
        A1(firstColumnIndex) = [];
        B1(firstColumnIndex) = [];
        % Remove edges from first row
        A2(firstRowIndex) = [];
        B2(firstRowIndex) = [];

    end
    
    g.adjacencyMatrix = sparse([A1 A2], [B1 B2], true(1,length(A1)+length(A2)), N, N);
    
    % Setup grid layout
    g.xNodeCoordinates = repmat(1:Nc,1,Nr);
    g.yNodeCoordinates = Nr-reshape(repmat(1:Nr, Nc,1),1,N);
    
end

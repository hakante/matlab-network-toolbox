function g = Generate3DGridGraph(N1, N2, N3, isCyclic)
    % Nodes 1:Nc, Nc+1:Nc*2, ..., (Nr-1)*Nc+1:Nr*Nc
    % Node i is then connected to i-1, i+1, i-Nc, i+Nc if valid
    %
    %  1  2  3  4  5
    %  6  7  8  9 10
    % 11 12 13 14 15

    if nargin < 4
        isCyclic = false;
    else
        % TODO isCyclic
        error('isCyclic not implemented yet');
    end
    
    g = Network.Graph();
    g.isDirected = false;
    
    N = N1*N2*N3;
    M = 3*N-N1*N2-N1*N3-N2*N3;
    
    g.xNodeCoordinates = zeros(1,N);
    g.yNodeCoordinates = zeros(1,N);

    v1 = zeros(2*M, 1);
    v2 = zeros(2*M, 1);

    ind = 1;
    for n1 = 1:N1
        for n2 = 1:N2
            for n3 = 1:N3
                i = n1+(n2-1)*N1+(n3-1)*N1*N2;
                g.xNodeCoordinates(i) = N2-n2 - n3/(2*N3);
                g.yNodeCoordinates(i) = n1 + n3/(3*N3);
                if n1>1
                    j = n1-1+(n2-1)*N1+(n3-1)*N1*N2;
                    v1(ind)=i; v2(ind)=j; ind=ind+1;
                end
                if n1<N1
                    j = n1+1+(n2-1)*N1+(n3-1)*N1*N2;
                    v1(ind)=i; v2(ind)=j; ind=ind+1;
                end
                if n2>1
                    j = n1+(n2-2)*N1+(n3-1)*N1*N2;
                    v1(ind)=i; v2(ind)=j; ind=ind+1;
                end
                if n2<N2
                    j = n1+(n2)*N1+(n3-1)*N1*N2;
                    v1(ind)=i; v2(ind)=j; ind=ind+1;
                end
                if n3>1
                    j = n1+(n2-1)*N1+(n3-2)*N1*N2;
                    v1(ind)=i; v2(ind)=j; ind=ind+1;
                end
                if n3<N3
                    j = n1+(n2-1)*N1+(n3)*N1*N2;
                    v1(ind)=i; v2(ind)=j; ind=ind+1;
                end
            end
        end
    end
   
    g.adjacencyMatrix = sparse(v1, v2, true(2*M, 1), N, N);
    
end

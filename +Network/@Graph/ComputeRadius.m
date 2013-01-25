% The eccentricity  of a vertex  is the greatest geodesic distance between
% and any other vertex. It can be thought of as how far a node is from the
% node most distant from it in the graph.
%
% The radius of a graph is the minimum eccentricity of any vertex.
%
% A central vertex in a graph is one whose eccentricity achieves the
% radius.

function [radius, centralVertices] = ComputeRadius( g )

    allPairsShortestPaths = g.AllPairsShortestPaths();
    
    nodeEccentricity = max(allPairsShortestPaths);
    
    if (max(nodeEccentricity) == Inf)
       error('The graph is not connected');
    end
    
    radius = min(nodeEccentricity);
    
    centralVertices = find(nodeEccentricity==radius);
    
end

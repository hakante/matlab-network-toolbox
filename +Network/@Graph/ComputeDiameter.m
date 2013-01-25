% The eccentricity  of a vertex  is the greatest geodesic distance between
% and any other vertex. It can be thought of as how far a node is from the
% node most distant from it in the graph.
%
% The diameter of a graph is the maximum eccentricity of any vertex in the
% graph. That is, it is the greatest distance between any pair of vertices.
% To find the diameter of a graph, first find the shortest path between
% each pair of vertices. The greatest length of any of these paths is the
% diameter of the graph.
%
% A peripheral vertex in a graph is one that achieves the diameter.

function [diameter, peripheralVertices] = ComputeDiameter( g )

    allPairsShortestPaths = g.AllPairsShortestPaths();
    
    nodeEccentricity = max(allPairsShortestPaths);
    
    diameter = max(nodeEccentricity);
    
    peripheralVertices = find(nodeEccentricity==diameter);
    
    if (diameter == Inf)
       warning('The graph is not connected');
    end
    
end

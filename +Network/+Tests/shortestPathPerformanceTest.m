clear;

g = Network.Graph.GenerateCycleGraph(500);

ITERATIONS = 10;

tic
for iteration = 1:ITERATIONS
    pl = g.ShortestPaths(1);
    pl(125); 
end
toc

tic
for iteration = 1:ITERATIONS
    pl = g.AllPairsShortestPaths();
    pl(1,125); 
end
toc

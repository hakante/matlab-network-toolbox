clear;

g = Network.Graph.GenerateCycleGraph(250);

ITERATIONS = 2;

tic
for iteration = 1:ITERATIONS
    pl = g.ShortestPaths(1);
    pl(125)
    toc
end

tic
for iteration = 1:ITERATIONS
    pl = g.AllPairsShortestPaths();
    pl(1,125)
    toc
end
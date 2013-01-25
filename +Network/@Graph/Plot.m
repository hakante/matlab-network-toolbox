function Plot( g )

    % Defaults to random position
    xCoordinates = g.xNodeCoordinates;
    if length(xCoordinates) ~= g.numberOfNodes
        xCoordinates = rand(1, g.numberOfNodes);
    end
    yCoordinates = g.yNodeCoordinates;
    if length(yCoordinates) ~= g.numberOfNodes
        yCoordinates = rand(1, g.numberOfNodes);
    end
    
    figure(86341324);
    refresh(86341324);
    
    % Draw nodes
    scatter(xCoordinates, yCoordinates);

    axis equal;
    title(g.name);
    hold on;

    % Draw edges
    for edge = g.adjacencyList';
        line([xCoordinates(edge(1)), xCoordinates(edge(2))],	...
             [yCoordinates(edge(1)), yCoordinates(edge(2))]);
    end
    hold off;

end

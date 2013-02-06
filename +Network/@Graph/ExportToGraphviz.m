function ExportToGraphviz(g, filename, generatePDF)
    if nargin < 2
        error('No file name given');
    end
    if nargin < 3
        generatePDF = false;
    end
    
    file = fopen(filename, 'w');
    if g.isDirected
        fprintf(file, 'digraph viz {\n');
    else
        fprintf(file, 'graph viz {\n');
    end
    fprintf(file, '\tnode [shape=circle, fixedsize=true, width=0.3, height=0.3, fontsize=10, margin=0];\n\tsplines = true;\n\toverlap=false;\n');
    for node = 1:g.numberOfNodes
        fprintf(file, '\t%d;\n', node);
    end
    for edge = g.adjacencyList'
        if g.isDirected
            fprintf(file, '\t%d -> %d;\n', edge(1), edge(2));
        else
            fprintf(file, '\t%d -- %d;\n', edge(1), edge(2));
        end
    end
    fprintf(file,'}\n');
    fclose(file);
    
    if generatePDF
        system(sprintf('sfdp -Tpdf %s -o %s.pdf', filename, filename));
    end

end
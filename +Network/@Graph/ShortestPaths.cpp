#include "mex.h"
#include <set>
#include <map>
#include <vector>

void mexFunction( const int nlhs, mxArray *plhs[], const int nrhs, const mxArray *prhs[]) {
	/* Check for proper number of arguments. */
	if (nrhs != 2 && nrhs != 3) {
		mexErrMsgIdAndTxt( "MATLAB:Graph:ShortestPaths:invalidNumInputs",
			"Two or three inputs required.");
	} else if (nlhs > 1) {
		mexErrMsgIdAndTxt( "MATLAB:Graph:ShortestPaths:invalidNumOutputs",
			"At most one output is allowed.");
	}

	const mxArray *numberOfNodesArray = mxGetProperty(prhs[0], 0, "numberOfNodes");
	if (!mxIsNumeric(numberOfNodesArray) || mxGetNumberOfElements(numberOfNodesArray) != 1) {
		mexErrMsgIdAndTxt( "MATLAB:Graph:ShortestPaths:invalidNumberOfNodes", "Number of nodes is not numeric scalar.");
	}
	const int numberOfNodes = mxGetScalar(numberOfNodesArray);
	if (numberOfNodes<1) {
		mexErrMsgIdAndTxt( "MATLAB:Graph:ShortestPaths:emptyGraph",
			"Graph is empty.");
	}

	const mxArray *pAdjacencyMatrix = mxGetProperty(prhs[0], 0, "pAdjacencyMatrix");
	if (!mxIsLogical(pAdjacencyMatrix) || mxGetN(pAdjacencyMatrix) != numberOfNodes || mxGetM(pAdjacencyMatrix) != numberOfNodes) {
		mexErrMsgIdAndTxt("MATLAB:Graph:ShortestPaths:invalidAdjacencyMatrix", "Adjacency matrix is not logical square matrix");
	}
	const bool *adjacencyMatrix = mxGetLogicals(pAdjacencyMatrix);

	if (!mxIsNumeric(prhs[1]) || mxGetNumberOfElements(prhs[1]) != 1) {
		mexErrMsgIdAndTxt( "MATLAB:Graph:ShortestPaths:invalidStartNode", "Start node is not numeric scalar.");
	}
	const int startNode = mxGetScalar(prhs[1])-1;
	if (startNode < 0 || startNode >= numberOfNodes) {
		mexErrMsgIdAndTxt( "MATLAB:Graph:ShortestPaths:invalidStartNode", "Start node is not in valid range.");
	}
    const int endNode = nrhs==3 ? mxGetScalar(prhs[2])-1 : -1;
    if (endNode < -1 || endNode >= numberOfNodes) {
		mexErrMsgIdAndTxt( "MATLAB:Graph:ShortestPaths:invalidEndNode", "End node is not in valid range.");
	}

	// Create output
	plhs[0] = mxCreateDoubleMatrix(numberOfNodes, 1, mxREAL);
	double *pathLengths = mxGetPr(plhs[0]);
	for (size_t i = 0; i < numberOfNodes; ++i)
		pathLengths[i] = (i == startNode ? 0 : mxGetInf());

	// Initalize graph
	std::vector<std::vector<int> > graph(numberOfNodes);
	if (mxIsSparse(pAdjacencyMatrix)) {
		// Sparse adjacency matrix
		const mwIndex* row = mxGetIr(pAdjacencyMatrix);
		const mwIndex* col = mxGetJc(pAdjacencyMatrix);
		const size_t nz = col[mxGetN(pAdjacencyMatrix)];
		mwIndex c = 0;
		for(size_t i = 0; i<nz; ++i) {
			while(col[c+1]<=i) ++c;
			if(adjacencyMatrix[i] && row[i] != c) {
				graph[row[i]].push_back(c);
			}
		}
	} else {
		// Full adjacency matrix
		for (size_t r = 0; r<numberOfNodes; ++r)
			for (size_t c = 0; c<numberOfNodes; ++c)
				if (adjacencyMatrix[r*numberOfNodes+c])
					graph[r].push_back(c);
	}

	std::set<std::pair<int,int> > queue;
	queue.insert(std::make_pair(0, startNode));

	// Dijkstra's algorithm
	while (!queue.empty()) {
		const int node = queue.begin()->second;
		queue.erase(queue.begin());

		std::vector<int>::const_iterator it = graph[node].begin();
		for (; it != graph[node].end(); ++it) {
			if (pathLengths[*it] > pathLengths[node] + 1) {
				queue.erase(std::make_pair(pathLengths[*it], *it));
				pathLengths[*it] = pathLengths[node] + 1;
				queue.insert(std::make_pair(pathLengths[*it], *it));
			}
		}
	}
    
    // If end node given
    if (endNode != -1) {
        double distance = pathLengths[endNode];
        mxDestroyArray(plhs[0]);
        plhs[0] = mxCreateDoubleScalar(distance);
    }
}

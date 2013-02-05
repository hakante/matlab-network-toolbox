#include "mex.h"

void mexFunction( const int nlhs, mxArray *plhs[], const int nrhs, const mxArray *prhs[]) {
	/* Check for proper number of arguments. */
	if (nrhs != 1) {
		mexErrMsgIdAndTxt( "MATLAB:Graph:AllPairsShortestPaths:invalidNumInputs",
			"One input required.");
	} else if (nlhs > 1) {
		mexErrMsgIdAndTxt( "MATLAB:Graph:AllPairsShortestPaths:invalidNumOutputs",
			"At most one output is allowed.");
	}

	const mxArray *numberOfNodesArray = mxGetProperty(prhs[0], 0, "numberOfNodes");
	if (!mxIsNumeric(numberOfNodesArray) || mxGetNumberOfElements(numberOfNodesArray) != 1) {
		mexErrMsgIdAndTxt( "MATLAB:Graph:AllPairsShortestPaths:invalidNumberOfNodes", "Number of nodes is not numeric scalar.");
	}
	const int numberOfNodes = mxGetScalar(numberOfNodesArray);
	if (numberOfNodes < 1) {
		mexErrMsgIdAndTxt( "MATLAB:Graph:AllPairsShortestPaths:emptyGraph",
			"Graph is empty.");
	}

	const mxArray *pAdjacencyMatrix = mxGetProperty(prhs[0], 0, "pAdjacencyMatrix");
	if (!mxIsLogical(pAdjacencyMatrix) || mxGetN(pAdjacencyMatrix) != numberOfNodes || mxGetM(pAdjacencyMatrix) != numberOfNodes) {
		mexErrMsgIdAndTxt("MATLAB:Graph:AllPairsShortestPaths:invalidAdjacencyMatrix", "Adjacency matrix is not logical square matrix");
	}
	const bool *adjacencyMatrix = mxGetLogicals(pAdjacencyMatrix);

	// Create output
	plhs[0] = mxCreateDoubleMatrix(numberOfNodes, numberOfNodes, mxREAL);
	double *pathLengths = mxGetPr(plhs[0]);

	// Initalize output
	if (mxIsSparse(pAdjacencyMatrix)) {
		// Sparse adjacency matrix
		for (size_t r = 0; r<numberOfNodes; ++r)
			for (size_t c = 0; c<numberOfNodes; ++c)
				pathLengths[r*numberOfNodes+c] = (r==c ? 0 : mxGetInf());

		const size_t nz = mxGetNzmax(pAdjacencyMatrix);
		const mwIndex* row = mxGetIr(pAdjacencyMatrix);
		const mwIndex* col = mxGetJc(pAdjacencyMatrix);
		mwIndex c = 0;
		for (size_t i = 0; i < nz; ++i) {
			while (col[c+1] <= i) ++c;
			if (adjacencyMatrix[i] && row[i] != c) {
				pathLengths[row[i]*numberOfNodes+c] = 1;
			}
		}

	} else {
		// Full adjacency matrix
		for (size_t r = 0; r < numberOfNodes; ++r)
			for (size_t c = 0; c < numberOfNodes; ++c)
				pathLengths[r*numberOfNodes+c] =
					(r==c ? 0 : adjacencyMatrix[r*numberOfNodes+c] ? 1 : mxGetInf());
	}

	// Floyd-Warshall algorithm, |N|^3
	for (size_t k = 0; k < numberOfNodes; ++k)
		for (size_t i = 0; i < numberOfNodes; ++i)
			for (size_t j = 0; j < numberOfNodes; ++j)
				if (pathLengths[i*numberOfNodes+k] + pathLengths[k*numberOfNodes+j] < pathLengths[i*numberOfNodes+j])
					pathLengths[i*numberOfNodes+j] = pathLengths[i*numberOfNodes+k] + pathLengths[k*numberOfNodes+j];

	for (size_t i = 0; i < numberOfNodes; ++i)
		if (pathLengths[i*numberOfNodes+i] < 0) {
			mexWarnMsgIdAndTxt( "MATLAB:Graph:AllPairsShortestPaths:negativeCycles", "Graph contains negative cycles");
			return;
		}
}

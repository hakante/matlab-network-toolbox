#include "mex.h"
#include <queue>
#include <vector>

void mexFunction( const int nlhs, mxArray *plhs[], const int nrhs, const mxArray *prhs[]) {
	/* Check for proper number of arguments. */
	if (nrhs != 1) {
		mexErrMsgIdAndTxt( "MATLAB:Graph:IsConnected:invalidNumInputs",
			"One input required.");
	} else if (nlhs > 1) {
		mexErrMsgIdAndTxt( "MATLAB:Graph:IsConnected:invalidNumOutputs",
			"At most one output is allowed.");
	}

	const mxArray *numberOfNodesArray = mxGetProperty(prhs[0], 0, "numberOfNodes");
	if (!mxIsNumeric(numberOfNodesArray) || mxGetNumberOfElements(numberOfNodesArray) != 1) {
		mexErrMsgIdAndTxt( "MATLAB:Graph:IsConnected:invalidNumberOfNodes", "Number of nodes is not numeric scalar.");
	}
	const int numberOfNodes = mxGetScalar(numberOfNodesArray);
	if (numberOfNodes < 1) {
		mexErrMsgIdAndTxt( "MATLAB:Graph:IsConnected:emptyGraph",
			"Graph is empty.");
	}

	const mxArray *pAdjacencyMatrix = mxGetProperty(prhs[0], 0, "pAdjacencyMatrix");
	if (!mxIsLogical(pAdjacencyMatrix) || mxGetN(pAdjacencyMatrix) != numberOfNodes || mxGetM(pAdjacencyMatrix) != numberOfNodes) {
		mexErrMsgIdAndTxt("MATLAB:Graph:IsConnected:invalidAdjacencyMatrix", "Adjacency matrix is not logical square matrix");
	}
	const bool *adjacencyMatrix = mxGetLogicals(pAdjacencyMatrix);

	const mxArray *pIsDirectedArray = mxGetProperty(prhs[0], 0, "pIsDirected");
	if (!mxIsLogicalScalar(pIsDirectedArray)) {
		mexErrMsgIdAndTxt( "MATLAB:Graph:IsConnected:invalidIsDirected", "Direction is not logical scalar");
	}
	const bool isDirected = mxIsLogicalScalarTrue(pIsDirectedArray);

	bool *reachable = new bool[numberOfNodes];


	if (mxIsSparse(pAdjacencyMatrix)) {
		// Sparse adjacency matrix
		std::vector<std::vector<mwIndex> > graph(numberOfNodes), rgraph(numberOfNodes);
		const mwIndex* row = mxGetIr(pAdjacencyMatrix);
		const mwIndex* col = mxGetJc(pAdjacencyMatrix);
		const size_t nz = col[mxGetN(pAdjacencyMatrix)];
		mwIndex c = 0;
		for(size_t i = 0; i<nz; ++i) {
			while(col[c+1]<=i) ++c;
			if(adjacencyMatrix[i]) {
				graph[row[i]].push_back(c);
				rgraph[c].push_back(row[i]);
			}
		}
		memset(reachable, false, numberOfNodes * sizeof(bool));
		reachable[0] = true;
		int nReachable = 1;
		std::queue<int> nodeQueue;
		nodeQueue.push(0);

		while(!nodeQueue.empty() && nReachable < numberOfNodes) {
			const int i = nodeQueue.front(); nodeQueue.pop();
			std::vector<mwIndex>::const_iterator it = graph[i].begin();

			for (; it != graph[i].end(); ++it) {
				if(!reachable[*it]) {
					reachable[*it] = true;
					nReachable++;
					nodeQueue.push(*it);
				}
			}
		}
		if (!isDirected || nReachable != numberOfNodes) {
			plhs[0] = mxCreateLogicalScalar(nReachable == numberOfNodes);
		} else {
			memset(reachable, false, numberOfNodes * sizeof(bool));
			reachable[0] = true;
			int nReachable2 = 1;
			nodeQueue = std::queue<int>(); // Clear queue
			nodeQueue.push(0);
			while(!nodeQueue.empty() && nReachable2 < numberOfNodes) {
				const int i = nodeQueue.front(); nodeQueue.pop();
				std::vector<mwIndex>::const_iterator it = rgraph[i].begin();
				for (; it != rgraph[i].end(); ++it) {
					if(!reachable[*it]) {
						mexPrintf("Reachable 2 is %lu\n", *it);
						reachable[*it] = true;
						nReachable2++;
						nodeQueue.push(*it);
					}
				}
			}
			plhs[0] = mxCreateLogicalScalar(nReachable2 == numberOfNodes);
		}
	} else {
		// Full adjacency matrix
		memset(reachable, false, numberOfNodes * sizeof(bool));
		reachable[0] = true;
		int nReachable = 1;
		std::queue<int> nodeQueue;
		nodeQueue.push(0);

		while(!nodeQueue.empty() && nReachable < numberOfNodes) {
			const int i = nodeQueue.front(); nodeQueue.pop();
			for (int j=0; j<numberOfNodes; ++j) {
				if(adjacencyMatrix[i*numberOfNodes+j] && !reachable[j]) {
					reachable[j] = true;
					nReachable++;
					nodeQueue.push(j);
				}
			}
		}
		if (!isDirected || nReachable != numberOfNodes) {
			plhs[0] = mxCreateLogicalScalar(nReachable == numberOfNodes);
		} else {
			memset(reachable, false, numberOfNodes * sizeof(bool));
			reachable[0] = true;
			int nReachable2 = 1;
			nodeQueue = std::queue<int>(); // Clear queue
			nodeQueue.push(0);
			while(!nodeQueue.empty() && nReachable2 < numberOfNodes) {
				const int i = nodeQueue.front(); nodeQueue.pop();
				for (int j=0; j<numberOfNodes; ++j) {
					if(adjacencyMatrix[j*numberOfNodes+i] && !reachable[j]) {
						reachable[j] = true;
						nReachable2++;
						nodeQueue.push(j);
					}
				}
			}
			plhs[0] = mxCreateLogicalScalar(nReachable2 == numberOfNodes);
		}
	}

	delete [] reachable;
}

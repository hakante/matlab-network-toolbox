function compile(nr)

    % Directory path of this file
    rootpath = fileparts(mfilename('fullpath'));

    % Files to compile
    files(1).source = '@Graph/IsConnected.cpp';
    files(1).output = '@Graph/IsConnected';
    files(2).source = '@Graph/AllPairsShortestPaths.cpp';
    files(2).output = '@Graph/AllPairsShortestPaths';
    files(3).source = '@Graph/ShortestPaths.cpp';
    files(3).output = '@Graph/ShortestPaths';
        
    % Translate relative path to platform dependent absolute path
    function newpath = translate(path)
        newpath = [rootpath filesep strrep(path, '/', filesep)];
    end
    
    if nargin < 1
        nr = 1:length(files);
    end

    for file = files(nr)
        % Compile the files!
        mexstr = ['mex -largeArrayDims -O ' translate(file.source) ' -output ' translate(file.output)];
        disp(mexstr);
        eval(mexstr);
    end
    
end
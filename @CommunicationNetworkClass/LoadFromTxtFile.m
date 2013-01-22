% TODO
%
function ImportFromTxt( tNetwork, strFileName )
	%
	% open the file
	fid = fopen(strFileName, 'r');
	%
	disp(tNetwork);
	%
	% close the file
	fclose(fid);
	clear fid;
	%
	fprintf('%s imported\n', strFileName);
	%
end %

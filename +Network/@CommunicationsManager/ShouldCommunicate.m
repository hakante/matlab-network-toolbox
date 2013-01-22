% returns true or false
%
% criterion: 
% IF
%     consensus has been reached
% THEN
%     you should not communicate anymore
%
function bShouldCommunicate = ShouldCommunicate( tCommunicationsManager, tResults, atNodes )
	%
	%
% 	if(		tResults.HasConsensusBeenReached( atNodes )	...
% 		||	tCommunicationsManager.iCurrentTime > 1000 				)
 	if(	tResults.HasConsensusBeenReached( atNodes ) )
		%
		bShouldCommunicate = false;
		%
	else%
		%
		bShouldCommunicate = true;
		%
	end;%
	%
	%
end %

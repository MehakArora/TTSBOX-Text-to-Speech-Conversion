function out=cart_run(features,cart,verbose)

% function out=cart_run(features,cart,verbose)
%
% Applies a cart to a given list of features to obtain 
% the predicted output
% Features is a string of features passed as characters
% Out is a character
% If verbose is set to 'verbose', details are printed on screen
% It it is set to 'n', nothing is printed
%
% Project: TTSBOX, a corpus-based speech synthesizer for Genglish
%
% Copyright (c) 2004 Faculte Polytechnique de Mons-Thierry Dutoit 
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation

question=cart{1};
yes_node=cart{2};
no_node =cart{3};

if (question{1}==0) 
   out=question{2};
   if strcmp(verbose,'verbose') fprintf('out=%c\n',out); end;
else
   if features(question{1})==question{2}
      if strcmp(verbose,'verbose') fprintf('%d=%c ',question{1},question{2}); end;
      out=cart_run(features,yes_node,verbose);
   else      
      if strcmp(verbose,'verbose') fprintf('%d~=%c ',question{1},question{2}); end;
      out=cart_run(features,no_node,verbose);
   end;
end;
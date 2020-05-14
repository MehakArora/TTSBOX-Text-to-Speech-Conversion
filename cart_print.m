function cart_print(cart,level)

% function cart_print(cart,level)
%
% Shows the content of a cart tree in text mode
% Level is used for indentation (should be left blank for top level)
% ex : cart_print(cart)
%
% Project: TTSBOX, a corpus-based speech synthesizer for Genglish
%
% Copyright (c) 2004 Faculte Polytechnique de Mons-Thierry Dutoit 
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation

if nargin==1
   level=0;
end;

question=cart{1};
yes_node=cart{2};
no_node =cart{3};
if (question{1}==0) 
   fprintf('out=%c\n',question{2});
else
   fprintf('if %d=%c ',question{1},question{2});
   cart_print(yes_node,level+1);
   for i=1:level fprintf('       '); end;   % indentation
   fprintf('else   ',question{1},question{2});
   cart_print(no_node,level+1);
end;
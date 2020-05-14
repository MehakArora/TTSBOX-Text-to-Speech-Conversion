function cart=tts_train_cart(father_node)

% function cart=tts_train_cart(father_node)
%
% Recursively builds a cart tree from father_node
% Members of father_node are assumed to be given as a vector of strings. 
% The first character of each string is the feature to predict; the others are context features
% Cart is a nested cell array of{question,yes_cart,no_cart}, unless father_node is a leaf.
% In this case, cart is a simple question of type {0,decision}
%
% Project: TTSBOX, a corpus-based speech synthesizer for Genglish
%
% Copyright (c) 2004 Faculte Polytechnique de Mons-Thierry Dutoit 
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation

[yes_node,no_node,question]=cart_find_best_split(father_node);
if question{1}~=0
   cart={question,cart_train(yes_node),cart_train(no_node)}; %recursive call :)
else
   cart={question,{},{}}; %leaf reached
end;
 
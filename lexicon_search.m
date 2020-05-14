function out=lexicon_search(in,lexicon)

% function out=lexicon_search(in,lexicon)
%
% Returns the object associated with a key (in) in a lexicon
% Lexicon is a 2-columns cell array whose first column is composed of strings (keys)
% Keys are supposed to be unique in the lexicon.
% Out can be of any type (the type of the elements in the second column of lexicon)
%
% Ex : lexicon_search('1', {'1',{'one'};'2',{'two'};'3',{'three'}}) returns 'one'
%
% Project: TTSBOX, a corpus-based speech synthesizer for Genglish
%
% Copyright (c) 2004 Faculte Polytechnique de Mons-Thierry Dutoit 
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation

index=strmatch(in,lexicon(:,1),'exact');
out = lexicon(index,2);
function possible_tags=tts_morph_using_lexicon(sentence,morph_lexicon)

% function possible_tags=tts_morph_using_lexicon(sentence,morph_lexicon)
% 
% Returns the possible part-of-speech categories associated with each word of sentence, 
% using a simple morphological lexicon
% morph_lexicon is a 2-column cell array (word,{list of possible pos})
% possible_tags is a cell array of cell arrays of strings ({list of possible pos})
% sentence is a 1-column cell arrays of strings
%
% Project: TTSBOX, a corpus-based speech synthesizer for Genglish
%
% Copyright (c) 2004 Faculte Polytechnique de Mons-Thierry Dutoit 
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation

n_words_in_sentence=length(sentence);

for i=1:n_words_in_sentence
   possible_tags{i,1}=lexicon_search(sentence{i},morph_lexicon);
end;

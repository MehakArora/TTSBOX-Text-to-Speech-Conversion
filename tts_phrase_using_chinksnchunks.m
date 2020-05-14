function phrase_indices=tts_phrase_using_chinksnchunks(chinks,chunks,words,tags)

% function phrase_indices=tts_phrase_using_chinksnchunks(chinks,chunks,words,tags)
%
% Applies the chinks'n chunks models to a sequence of words and returns 
% an array of indices relating words to groups.
% Chinks and chinks are passed as 2-column cell arrays of string : word and part of speech
% If '' is provided as part of speech, all are accepted by default
% Words and tags are passed as a 1-column cell array of strings (one word per line)
% ex : tts_apply_chinksnchunks({'a','x'},{'a','y';'b',''},{'a';'b';'a';'a';'b'},{'x';'y';'y';'x';'y'})
%      returns the following index array [1;1;1;2;2]
%
% Project: TTSBOX, a corpus-based speech synthesizer for Genglish
%
% Copyright (c) 2004 Faculte Polytechnique de Mons-Thierry Dutoit 
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation

n_words_in_sentence=length(words);

phrase_indices=ones(n_words_in_sentence,1);

for i=2:n_words_in_sentence
   phrase_indices(i)=phrase_indices(i-1); % by default
   % Look for a chunk followed by a chink (taking tags into account too, if specified in chinks or chunks) 
   j=strmatch(words{i-1},chunks(:,1),'exact');
   if (~isempty(j)) 
       if (isempty(chunks{j,2})) | (strcmp(tags(i-1),chunks{j,2})) 
          k=strmatch(words(i),chinks(:,1),'exact');
          if (~isempty(k))
             if (isempty(chinks{k,2})) | (strcmp(tags(i),chinks{k,2}))
                phrase_indices(i)=phrase_indices(i-1)+1;
             end;
          end;
       end;
   end;
end
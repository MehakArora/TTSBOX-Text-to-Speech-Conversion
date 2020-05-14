function [morph_lex,pos_lex,graph_lex,phon_lex]=corpus_to_lexicons(corpus)

% function [morph_lex,pos_lex,graph_lex,phon_lex]=corpus_to_lexicons(corpus)
%
% Takes a language corpus as input, provided as a 3-columns cell array of strings
% (word+pos+pronunciation) and builds the four main lexicons used by a tts : 
%  -a morphological lexicon (all the words encountered in the corpus (in lower case) 
%                            + list of possible part-of-speech tags)
%  -a part-of-speech lexicon (all the tags encountered in the corpus)
%  -a grapheme lexicon (all the letters encountered in the corpus)
%  -a phoneme lexicon (all the phonemes encountered in the corpus)
% The first lexicon  is returned as a 2-column cell array, each line 
% containing : word {list of pos}
% The other 3 lexicons are returned as 1-column cell arrays of strings
%
% Project: TTSBOX, a corpus-based speech synthesizer for Genglish
%
% Copyright (c) 2004 Faculte Polytechnique de Mons-Thierry Dutoit 
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation

 morph_lex=unique(corpus(:,1));
 
 %for each entry in morph_lex, get its set of possible tags
 for i=1:length(morph_lex)
    indices=(strcmp(corpus(:,1),morph_lex(i)));
    tags=corpus(indices,2);
    morph_lex(i,2)={unique(tags)'};
 end;

 %keep all words in lowercase
 morph_lex(:,1)=lower(morph_lex(:,1));

 pos_lex=unique(corpus(:,2));

 phon_lex=unique(corpus(:,3)); %set of phonetic words
 phon_lex=unique(strcat(phon_lex{:})); %set of phonemes

 graph_lex=unique(strcat(morph_lex{:,1}));


%
% Project: TTSBOX, a corpus-based speech synthesizer for Genglish
%
% Copyright (c) 2004 Faculte Polytechnique de Mons-Thierry Dutoit 
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation

%Finding Genglish prosodic phrases on the test corpus

%Defining chinks and chunks
 genglish_load_chinksnchunks;

%Applying the algorithm on the test corpus

 genglish_load_corpus;

 sentence_start=1;
 sentence_end=1;
 
 while sentence_end<=100  %for all sentences in the first 100 words of the corpus

    while (strcmp(genglish_corpus(sentence_end,1),'.')~=1) 
       sentence_end=sentence_end+1; %find current sentence end
    end;

    words=genglish_corpus(sentence_start:sentence_end);
    tags=genglish_corpus(sentence_start:sentence_end,2);
    phrase_indices=tts_phrase_using_chinksnchunks(genglish_chinks,genglish_chunks,words,tags);
    phrase_indices' % prints all phrases
    fprintf('--------------------------------');

    sentence_start=sentence_end+1;
    sentence_end=sentence_start;
    
 end;  
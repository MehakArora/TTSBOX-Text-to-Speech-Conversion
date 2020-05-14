function phonemes=tts_phonetize_using_cart(sentence,tags,cart,verbose)

% function phonemes=tts_phonetize_using_cart(sentence,tags,cart,verbose)
%
% Uses a cart to derive the sequence of phonemes corresponding 
% to a sentence, compose of a list words or punctuations, with part-of-speech categories
% Sentence is passed as a 1-column cell array of strings : spelling
% tags is passed as a 1-column cell array of strings : part-of-speech tags
% Phonemes is a 1-column cell array of strings. 
% If verbose is set to 'verbose', details are printed on screen
%
% Project: TTSBOX, a corpus-based speech synthesizer for Genglish
%
% Copyright (c) 2004 Faculte Polytechnique de Mons-Thierry Dutoit 
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation

 for i=1:length(sentence(:)) % for all words
    if strcmp(tags{i,1},'punctuation')
       phonemes{i,1}='_';
    else
       % word spelling is used as a dummy sepquence of phonemes; not used anyway
       word_features=corpus_to_phonetic_corpus({sentence{i},tags{i},sentence{i}});
    
       word_transcription='';
       for j=1:length(word_features(:,1))
          word_transcription(j)=cart_run(word_features(j,2:7),cart,verbose);
       end;
       phonemes{i,1}=word_transcription;

       if strcmp(verbose,'verbose')
           fprintf('word=%s   pos=%s   phonemes=%s\n',sentence{i},tags{i},word_transcription);
           fprintf('---------------------------------\n');
       end;
    end; 
 end;
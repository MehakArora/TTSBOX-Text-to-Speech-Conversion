function phonetic_corpus=corpus_to_phonetic_corpus(corpus)

% function phonetic_corpus=_to_phonetic_corpus(corpus)
%
% Builds a specific phonetic corpus from a general language corpus, for training a phonetic cart tree.
% corpus is 3-columns cell array of strings (word+pos+pronunciation) 
% phonetic_corpus is an array of characters : one line for each character of each word 
% of training_corpus, and 7 columns : 
%    associated phoneme, current character, 2 characters on the left, 
%    2 characters on the right, verb/nonverb distinction
%
% Project: TTSBOX, a corpus-based speech synthesizer for Genglish
%
% Copyright (c) 2004 Faculte Polytechnique de Mons-Thierry Dutoit 
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation

 corpus_size=size(corpus);
 n_entries=corpus_size(1); %number of entries (words or punctuations) in the corpus

% Preallocating memory space for the phonetic corpus : at most 8 times the number of words 
% in the training corpus, each character requiring 7 fields :
%    phoneme, current letter, 2 letters on the left; 2 letters on the right, verb/nonverb distinction

 phonetic_corpus=zeros(n_entries*8,7); %assuming words are not more than 8 letters long 

 index=1; %index in the phonetic corpus

 for i=1:n_entries
     word=corpus{i,1};
     tag=corpus{i,2};
     phonemes=corpus{i,3};
     if ~strcmp(tag,'punctuation')  %do not store punctuations in the phonetic corpus
        word_length=length(word);
        for j=1:word_length
           phonetic_corpus(index,1)=phonemes(j);
           phonetic_corpus(index,2)=word(j);
           if (j>2) phonetic_corpus(index,3)=word(j-2); else phonetic_corpus(index,3)='_'; end;
           if (j>1) phonetic_corpus(index,4)=word(j-1); else phonetic_corpus(index,4)='_'; end;
           if (j<word_length) phonetic_corpus(index,5)=word(j+1); else phonetic_corpus(index,5)='_'; end;
           if (j<word_length-1) phonetic_corpus(index,6)=word(j+2); else phonetic_corpus(index,6)='_'; end;
           if (strcmp(tag,'verb') | strcmp(tag,'participle'))
              phonetic_corpus(index,7)='V';
           else
              phonetic_corpus(index,7)='N';
           end;
           index=index+1;
        end;
     end;
 end;

%keeping only the meaningful entries in phonetic_corpus and making it readable

 phonetic_corpus=char(phonetic_corpus(1:index-1,:)); 
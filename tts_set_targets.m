function target_sequence=tts_set_targets(sentence,tags,phrases,phonemes);

% target_sequence=tts_set_targets(sentence,tags,phrases,phonemes);
% 
% Sentence, tags, phrases and phonemes are cell array of strings with the
% same # of rows (1 per word/punctuation)
% Creates a target list, of which each row is a string of characters : 
%           1: the name of the current phoneme
%           2: the name of the left phoneme
%           3: the name of the right phoneme, 
%           4: the part-of-speech (pos) of the current word (using one character per pos; see table below)
%           5: the index of the current prosodic phrase (within the current sentence, from 1 to max 9)
%           6: the number of prosodic phrases on the right (until the end of the sentence, from 1 to max 9)
%           7: the index of the current word (within the current prosodic phrase, from 1 to max 9)
%           8: the number of words on the right (until the end of the current prosodic phrase, from 1 to max 9)
%
% Project: TTSBOX, a corpus-based speech synthesizer for Genglish
%
% Copyright (c) 2004 Faculte Polytechnique de Mons-Thierry Dutoit 
%                    - Slovak Academy of Science - Milos Cernak
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation

% assign POS shortcuts
pos_shortcuts={ 'adjective','a'
                'adverb','b'
                'auxiliary','x'
                'coordinator','c'
                'determiner','d'
                'noun','n'
                'of','o'
                'participle','p'
                'preposition','r'
                'pronoun','u'
                'propername','e'
                'punctuation','i'
                'subordinator','s'
                'to','t'
                'verb','v'};

n_tokens=length(phrases);
n_phrases=phrases(n_tokens);

% get rid of null phonemes '_'
n_phonemes=0;
phonemic_sentence='';
for i=1:n_tokens
    % Skip all '_' phonemes (except for internal punctuations)
    if (~strcmp(tags(i),'punctuation'))
      tmp=phonemes{i};
   	  phonemes{i}=tmp(find(tmp~='_'));  
    end;
    phonemic_sentence=[phonemic_sentence phonemes{i}];
end;

% Add fake leading and trainling silences
if phonemic_sentence(1)~='_'
    phonemes{1}=['_' phonemes{1}];
    phonemic_sentence=['_' phonemic_sentence];        
end;
if phonemic_sentence(length(phonemic_sentence))~='_'
    phonemes{n_tokens}=[phonemes{n_tokens} '_'];
    phonemic_sentence=[phonemic_sentence '_'];        
end;
phonemes
n_phonemes=length(phonemic_sentence);

target_sequence=cell(n_phonemes,1);
index=1; %index of the row in the target list
prev_phoneme='#';
n_prev_phonemes=0;

for i=1:n_tokens %for each token : word or punctuation
    % compute contextual features for the current word
    tag = char(tags(i));
    indice=strmatch(tag,char(pos_shortcuts{:,1}),'exact'); 
    tag_short=pos_shortcuts{indice,2};
    index_phrase_in_sentence=phrases(i);
    right_phrases_in_sentence=n_phrases-index_phrase_in_sentence;
    if i>1
       if phrases(i-1)==phrases(i)
            index_word_in_phrase=index_word_in_phrase+1;
       else index_word_in_phrase=1; 
       end;
    else index_word_in_phrase=1; 
    end;
       
    n_words_in_phrase=sum(phrases==index_phrase_in_sentence);
    right_words_in_phrase=n_words_in_phrase-index_word_in_phrase;
    
    % set to 9 if greater than 9 (for simplicity)
    index_phrase_in_sentence=min(9,index_phrase_in_sentence);
    right_phrases_in_sentence=min(9,right_phrases_in_sentence);
    index_word_in_phrase=min(9,index_word_in_phrase); 
    right_words_in_phrase=min(9,right_words_in_phrase); 
    
    % compute contextual features for each phoneme of the current word
    word_length=length(phonemes{i});
    for j=n_prev_phonemes+1:n_prev_phonemes+word_length
        target(1)=phonemic_sentence(j);  % 1st feature = current phoneme
        target(2)=prev_phoneme;   % 2nd feature = previous phoneme
        prev_phoneme=target(1);
        if (j<n_phonemes)
            target(3)=phonemic_sentence(j+1);
        else
            target(3)='#';
        end;
        target(4)=tag_short;
        target(5)=int2str(index_phrase_in_sentence);
        target(6)=int2str(right_phrases_in_sentence);
        target(7)=int2str(index_word_in_phrase);
        target(8)=int2str(right_words_in_phrase);
        target_sequence{j,1}=char(target);    
    end;    
    n_prev_phonemes=n_prev_phonemes+word_length;
end;

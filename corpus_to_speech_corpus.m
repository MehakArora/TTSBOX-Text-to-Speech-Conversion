function speech_corpus=corpus_to_speech_corpus(corpus)

%  function speech_corpus=corpus_to_speech_corpus(corpus)
%
%  Based on the content of a word corpus containing a list of items (i.e. words and punctuations)
%  as well as their part-of-speech information and phonetization, together with the corresponding .wav files  
%  and their phonetic segmentation in accompanying .seg files, this function creates a speech corpus which 
%  lists all phonemes available (one per row) together with a mixture of contextual phonetic and 
%  prosodic information, and pointers to their actual position in wav files.
%  Each row contains :
%     1 : a string of characters : 
%           1: the name of the current phoneme
%           2: the name of the left phoneme
%           3: the name of the right phoneme, 
%           4: the part-of-speech (pos) of the current word (using one character per pos; see table below)
%           5: the index of the current prosodic phrase (within the current sentence, from 1 to max 9)
%           6: the number of prosodic phrases on the right (until the end of the sentence, from 1 to max 9)
%           7: the index of the current word (within the current prosodic phrase, from 1 to max 9)
%           8: the number of words on the right (until the end of the current prosodic phrase, from 1 to max 9)
%     2: the index of the sentence containing the phoneme (related wav file names are given by this index)
%     3: the start sample for the current phoneme in the related wav file
%     4: the end sample for the current phoneme in the related wav file
%     
%  Usage:
%   >> genglish_load_corpus;
%   >> speech_corpus=corpus_to_speech_corpus(genglish_corpus);
%   
%  Used POS shortcuts:
%     'adjective'     a
%     'adverb'        b
%     'auxiliary'     x
%     'coordinator'   c
%     'determiner'    d
%     'noun'          n
%     'of'            o
%     'participle'    p
%     'preposition'   r
%     'pronoun'       u
%     'propername'    e
%     'punctuation'   i  
%     'subordinator'  s
%     'to'            t
%     'verb'          v
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

genglish_load_chinksnchunks;

index=1; %index in the speech corpus - phonemes
sentence_index=0; %index in the current sentence in the speech corpus
word_in_sentence=1; % index of the current word in the current sentence
sentence_end=0;

while (sentence_end<length(corpus))
% process next sentence ion the corpus
    sentence_index=sentence_index+1; % Next sentence
    sentence_start=sentence_end+1;
    sentence_end=sentence_start;
    while (strcmp(corpus(sentence_end),'.')~=1) 
        sentence_end=sentence_end+1; %find current sentence end
    end;
    sentence=corpus(sentence_start:sentence_end,1);
    n_words=sentence_end-sentence_start+1;
    
    tags=corpus(sentence_start:sentence_end,2);
    phrase_indices=tts_phrase_using_chinksnchunks(chinks,chunks,sentence,tags);
    
    word_in_sentence=0; % a pointer to current word in the sentence
	% load current .seg file
    file_seg_name=strcat('./seg/',int2str(sentence_index),'.seg');
	[ph_start_seg,ph_stop_seg,ph_seg]=textread(file_seg_name,'%f %f %s');
	position_in_seg=1;  % position in .seg file

	% set unit sequence for the current sentence
    for i=sentence_start:sentence_end 
        % compute contextual features for the current word
        tag=corpus{i,2};
        if strcmp(tag,'punctuation') % do not store punctuations in the speech corpus
            continue;
        end;
        phonemes=corpus{i,3};
        word_length=length(phonemes);
        indice=strmatch(tag,char(pos_shortcuts{:,1}),'exact'); 
        tag_short=pos_shortcuts{indice,2};
        index_phrase_in_sentence=phrase_indices(i-sentence_start+1);
        right_phrases_in_sentence=phrase_indices(length(phrase_indices))-index_phrase_in_sentence;
        if i>sentence_start
             if phrase_indices(i-sentence_start)==phrase_indices(i-sentence_start+1)
                 index_word_in_phrase=index_word_in_phrase+1;
             else 
                 index_word_in_phrase=1; 
             end;
        else 
            index_word_in_phrase=1; 
        end;
        count_of_words_in_same_phrase=((phrase_indices==index_phrase_in_sentence) & ~strcmp(tags,'punctuation'));
        n_words_in_phrase=sum(count_of_words_in_same_phrase);
        right_words_in_phrase=n_words_in_phrase-index_word_in_phrase;        
        
        % set to 9 if greater than 9 (for simplicity)
        index_phrase_in_sentence=min(9,index_phrase_in_sentence);
        right_phrases_in_sentence=min(9,right_phrases_in_sentence);
        index_word_in_phrase=min(9,index_word_in_phrase); 
        right_words_in_phrase=min(9,right_words_in_phrase); 
        
        % compute contextual features for each phoneme of the current word
        
        if (ph_seg{position_in_seg}=='_')
            % First "_" character in the seg files must be taken into
            % account!
            phoneme=ph_seg(position_in_seg);
            target_sequence(index,1)=char(phoneme);
            target_sequence(index,2)='#';
            target_sequence(index,3)=char(ph_seg(position_in_seg+1));                      
            target_sequence(index,4)=tag_short;
            target_sequence(index,5)=num2str(index_phrase_in_sentence);
            target_sequence(index,6)=num2str(right_phrases_in_sentence);
            target_sequence(index,7)=num2str(index_word_in_phrase);
            target_sequence(index,8)=num2str(right_words_in_phrase);
            speech_corpus(index,1)={target_sequence(index,:)};
            speech_corpus(index,2)={sentence_index};
            speech_corpus(index,3)={ph_start_seg(position_in_seg)};
            speech_corpus(index,4)={ph_stop_seg(position_in_seg)};
            
            index=index+1; % Next phoneme in speech_corpus variable
            position_in_seg=position_in_seg+1; % Next phoneme in .seg file
        end; % process next phoneme
       
        for j=1:word_length
            % skip all '_' in the orthoepic phonetic
            % transcription until the agree with the current seg file.
            if (phonemes(j)=='_')
                continue;
            else
                phoneme=ph_seg(position_in_seg);
            end;
            target_sequence(index,1)=char(phoneme);    % 1st feature
            if (j == 1 && i==sentence_start) 
                target_sequence(index,2)='#';    % beginning of sentence
            else 
                target_sequence(index,2)=char(ph_seg(position_in_seg-1)); 
            end;
            if (j == word_length && i==sentence_end-1) % -1 : skip final '.' 
                target_sequence(index,3)='#';    % end of sentence
            else 
                target_sequence(index,3)=char(ph_seg(position_in_seg+1));                      
            end;
            target_sequence(index,4)=tag_short;
            target_sequence(index,5)=num2str(index_phrase_in_sentence);
            target_sequence(index,6)=num2str(right_phrases_in_sentence);
            target_sequence(index,7)=num2str(index_word_in_phrase);
            target_sequence(index,8)=num2str(right_words_in_phrase);

            speech_corpus(index,1)={target_sequence(index,:)};
            speech_corpus(index,2)={sentence_index};
            speech_corpus(index,3)={ph_start_seg(position_in_seg)};
            speech_corpus(index,4)={ph_stop_seg(position_in_seg)};
            
            index=index+1; % Next phoneme in speech_corpus variable
            position_in_seg=position_in_seg+1; % Next phoneme in .seg file
        end;
                
        while (position_in_seg<=length(ph_seg) && ph_seg{position_in_seg}=='_')
            % "_" characters in the seg files must be taken into
            % account!
            % NB : they are assumed to appear only between words
            % and are attached to the previous word
            phoneme=ph_seg(position_in_seg);
            target_sequence(index,1)=char(phoneme);
            if (j == 1 && i==sentence_start) 
                target_sequence(index,2)='#';    % beginning of sentence
            else 
                target_sequence(index,2)=char(ph_seg(position_in_seg-1)); 
            end;
            if (j == word_length && i==sentence_end-1) % -1 : skip final '.' 
                target_sequence(index,3)='#';    % end of sentence
            else 
                target_sequence(index,3)=char(ph_seg(position_in_seg+1));                      
            end;
            target_sequence(index,4)=tag_short;
            target_sequence(index,5)=num2str(index_phrase_in_sentence);
            target_sequence(index,6)=num2str(right_phrases_in_sentence);
            target_sequence(index,7)=num2str(index_word_in_phrase);
            target_sequence(index,8)=num2str(right_words_in_phrase);

            speech_corpus(index,1)={target_sequence(index,:)};
            speech_corpus(index,2)={sentence_index};
            speech_corpus(index,3)={ph_start_seg(position_in_seg)};
            speech_corpus(index,4)={ph_stop_seg(position_in_seg)};
            
            index=index+1; % Next phoneme in speech_corpus variable
            position_in_seg=position_in_seg+1; % Next phoneme in .seg file
        end; % process next phoneme
    end; %process next word       
end;  % process next sentence

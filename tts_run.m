function speech=tts_run(sentence_chars,verbose)

% function speech=tts_run(sentence_chars, verbose)
%
% TTS itself
% NB : A language initialization file must be run before running this function, in order to define the following global variables
% Setting verbose to 'verbose' will print all internal details, module outputs, and send speech to audio
% Setting it to 'results' will only show outputs of modules and send speech to audio
% setting it to 'audio' will only send speech to audio
%
% Example : 
% 
%   genglish_init_tts
%   speech=tts_run('Gengles are gengling John gengles on the genglish gengle','verbose');
%
% Project: TTSBOX, a corpus-based speech synthesizer for Genglish
%
% Copyright (c) 2004 Faculte Polytechnique de Mons-Thierry Dutoit 
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation

global morph_lex
global pos_lex
global graph_lex
global phon_lex
global emission_probs
global transition_probs
global phonetic_cart
global chinks
global chunks
global speech_corpus

% Sentence preprocessing (one word or punctuation per line)
sentence=tts_preprocess_using_fsm(sentence_chars);
if ismember(verbose,['verbose','results']) 
    sentence 
end;
% Morphological analysis
possible_tags=tts_morph_using_lexicon(sentence,morph_lex);
if ismember(verbose,['verbose','results']) 
    possible_tags 
end;

%Part-of-speech tagging
tags=tts_tag_using_bigrams(emission_probs,transition_probs,morph_lex,pos_lex,sentence,possible_tags);
if ismember(verbose,['verbose','results']) 
    tags
end;

%Phrasing
phrase_indices=tts_phrase_using_chinksnchunks(chinks,chunks,sentence,tags);
if ismember(verbose,['verbose','results']) 
    phrase_indices 
end;

%Phonetization
phonemes=tts_phonetize_using_cart(sentence,tags,phonetic_cart,verbose);
if ismember(verbose,['verbose','results']) 
    phonemes 
end;

%Incorporation of the previous data into a synthesis target list
target_sequence=tts_set_targets(sentence,tags,phrase_indices,phonemes);
if ismember(verbose,['verbose','results']) 
    target_sequence 
end;

%Unit selection
units=tts_select_units(speech_corpus,target_sequence,verbose);
if ismember(verbose,['verbose','results']) 
    units 
end;

%Concatenative synthesis
speech=tts_concatenate_using_xorr(speech_corpus,units);		
if ismember(verbose,['verbose','results','audio']) 
    sound(speech,16000);
end;
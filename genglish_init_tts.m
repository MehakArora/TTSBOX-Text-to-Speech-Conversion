%
% Project: TTSBOX, a corpus-based speech synthesizer for Genglish
%
% Copyright (c) 2004 Faculte Polytechnique de Mons-Thierry Dutoit 
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation

% This script loads all necessary data for performing TTS

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

%Loading the Genglish training and test corpora
 fprintf('Loading the Genglish training and test corpora\n');
 genglish_load_corpus;

%Computing Genglish lexicons
 fprintf('Computing Genglish lexicons\n');
 [morph_lex,pos_lex,graph_lex,phon_lex]=corpus_to_lexicons(genglish_corpus);

%Computing Genglish bigram transition and emission probabilities
 fprintf('Computing Genglish bigram transition and emission probabilities\n');
 [emission_probs,transition_probs]=corpus_to_bigrams(genglish_corpus);

%Loading Genglish phonetic training corpus
 fprintf('Loading Genglish phonetic training corpus\n');
 phonetic_corpus=corpus_to_phonetic_corpus(genglish_corpus);

%Training carts
 fprintf('Training carts\n')
 phonetic_cart=cart_train(phonetic_corpus);

%Loading chinks and chunks
 fprintf('Loading chinks and chunks\n')
 genglish_load_chinksnchunks;

%Preparing the NUU corpus
 fprintf('Preparing the NUU corpus\n')
 speech_corpus=corpus_to_speech_corpus(genglish_corpus);
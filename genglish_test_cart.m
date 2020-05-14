% Project: TTSBOX, a corpus-based speech synthesizer for Genglish
%
% Copyright (c) 2004 Faculte Polytechnique de Mons-Thierry Dutoit 
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation

% Load training corpus and train cart

 genglish_load_corpus; 
 genglish_phonetic_corpus=corpus_to_phonetic_corpus(genglish_corpus);

 genglish_phonetic_cart=cart_train(genglish_phonetic_corpus);
 cart_print(genglish_phonetic_cart);

% Apply cart to test corpus

 phonemes=tts_phonetize_using_cart(genglish_test_corpus(:,1),genglish_test_corpus(:,2),genglish_phonetic_cart,'verbose');

 number_of_errors=0;
 total_number_of_words=length(genglish_test_corpus(:,1));

 for i=1:total_number_of_words
    if ~strcmp(phonemes{i},genglish_test_corpus{i,3})
        fprintf('error:');
        phonemes{i}
        genglish_test_corpus{i,3}
        number_of_errors=number_of_errors+1;
    end;
 end;

 word_error_rate=number_of_errors/total_number_of_words
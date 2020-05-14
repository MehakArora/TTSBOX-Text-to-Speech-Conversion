%
% Project: TTSBOX, a corpus-based speech synthesizer for Genglish
%
% Copyright (c) 2004 Faculte Polytechnique de Mons-Thierry Dutoit 
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation

%Loading Genglish training and test corpora

 genglish_load_corpus; 

%Computing Genglish bigram transition and emission probabilities

 [emission_probs,transition_probs]=corpus_to_bigrams(genglish_corpus);

%Testing first on the training corpus

 [genglish_morphlex,genglish_pos,graph_lex,phon_lex]=corpus_to_lexicons(genglish_corpus);

 sentence_start=1;
 sentence_end=1;
 number_of_errors=0;

 while sentence_end<=100  %for all sentences in the first 100 words of the corpus

    fprintf('--------------------------------------------');

    % Findind end of current sentence (assuming each '.' is a sentence end)
    while (strcmp(genglish_corpus(sentence_end),'.')~=1) 
       sentence_end=sentence_end+1; %find current sentence end
    end;

    % Performing morphological analysis
    untagged_sentence=genglish_corpus(sentence_start:sentence_end,1)
    possible_tags=tts_morph_using_lexicon(untagged_sentence,genglish_morphlex);

    % Tagging
    [tags,lattice_size]=tts_tag_using_bigrams(emission_probs,transition_probs,genglish_morphlex,genglish_pos,untagged_sentence,possible_tags);

    % Printing results
    tagging=[untagged_sentence tags]
    ambiguity=lattice_size

    % Counting errors
    errors=sum(1-strcmp(tags,genglish_corpus(sentence_start:sentence_end,2)));
    errors_in_sentence=sum(errors)
    number_of_errors=number_of_errors+errors_in_sentence;

    % Next sentence
    sentence_start=sentence_end+1;
    sentence_end=sentence_start;
    
 end;

 total_number_of_tags=sentence_end-1;
 fprintf('==============================================\n');
 fprintf('on ~100 words from training corpus :\n');
 error_rate=number_of_errors/total_number_of_tags


%Testing on the test corpus

 sentence_start=1;
 sentence_end=1;
 number_of_errors=0;

 while sentence_end<=100  %for all sentences in the first 100 words of the corpus

    fprintf('--------------------------------------------');

    while (strcmp(genglish_test_corpus(sentence_end),'.')~=1) 
       sentence_end=sentence_end+1; %find current sentence end
    end;

    % Performing morphological analysis
    untagged_sentence=genglish_test_corpus(sentence_start:sentence_end,1);
    possible_tags=tts_morph_using_lexicon(untagged_sentence,genglish_morphlex);

    % Tagging
    [tags,lattice_size]=tts_tag_using_bigrams(emission_probs,transition_probs,genglish_morphlex,genglish_pos,untagged_sentence,possible_tags);

    % Printing results
    tagging=[untagged_sentence tags]
    ambiguity=lattice_size

    %counting errors
    errors=sum(1-strcmp(tags,genglish_test_corpus(sentence_start:sentence_end,2)));
    errors_in_sentence=sum(errors)
    number_of_errors=number_of_errors+errors_in_sentence;

    sentence_start=sentence_end+1;
    sentence_end=sentence_start;
    
 end;

 total_number_of_tags=sentence_end-1;
 fprintf('==============================================\n');
 fprintf('on ~100 words from test corpus :\n');
 error_rate=number_of_errors/total_number_of_tags  
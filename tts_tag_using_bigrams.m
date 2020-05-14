function [tags,n_possible_tag_sequences]=tts_tag_using_bigrams(emission_probs,transition_probs,morph_lexicon,set_of_pos,words,possible_tags)

% function [tags,n_possible_tag_sequences]=tts_tag_using_bigrams
%          (emission_probs,transition_probs,morph_lexicon,set_of_pos,words,possible_tags)
% 
% Returns the part-of-speech tags associated with each word of a sentence, 
% using the bigram model provided in emission_probs and transition_probs.
% n_possible_tag_sequences is the number of possible paths in the pos lattice.
% morph_lexicon is a 2-column cell array (word,{list of possible pos})
% words, morph_lexicon and tags are 1-column cell arrays of strings
%
% Project: TTSBOX, a corpus-based speech synthesizer for Genglish
%
% Copyright (c) 2004 Faculte Polytechnique de Mons-Thierry Dutoit 
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation

n_words_in_sentence=length(words);

% Making sure no prob is set to 0
% NB : probs no longer sum to 1, but not a big problem since only max. prob. is interesting.
emission_probs=emission_probs+1e-8;
transition_probs=transition_probs+1e-8;

%for i=1:n_words_in_sentence
%   state_list{i}=tts_lex_search(words{i},morph_lexicon);
%end;

possible_tag_sequences=lattice_get_all_paths(possible_tags);
n_possible_tag_sequences=length(possible_tag_sequences);

% Computing marginal_probabilities (prob of starting a sentence with a given tag)
n_pos_tags=length(set_of_pos); %number of POS tags
for i=1:n_pos_tags
   marginal_probs(i)=sum(transition_probs(i,:));
end;

% Computing probabilities on all paths 
lexicon=morph_lexicon(:,1);
probs=zeros(n_possible_tag_sequences,1);
for i=1:n_possible_tag_sequences
   pos_index=strmatch(possible_tag_sequences{i}{1},set_of_pos,'exact');
   loglikelihoods(i)=-log10(marginal_probs(pos_index));
   word_index=strmatch(words{1},lexicon,'exact');
   probs(i)=loglikelihoods(i)-log10(emission_probs(word_index,pos_index));
   for j=2:n_words_in_sentence
   	previous_pos_index=pos_index;
   	pos_index=strmatch(possible_tag_sequences{i}{j},set_of_pos,'exact');
   	loglikelihoods(i)=loglikelihoods(i)-log10(transition_probs(pos_index,previous_pos_index));
   	word_index=strmatch(words{j},lexicon,'exact');
   	loglikelihoods(i)=loglikelihoods(i)-log10(emission_probs(word_index,pos_index));
   end;
end

% Computing path with max probabililty (i.e. min loglikelihood)
[max,index_max]=min(loglikelihoods);
tags=possible_tag_sequences{index_max};
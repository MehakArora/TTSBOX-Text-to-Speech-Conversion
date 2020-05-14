function [emission_probs,transition_probs]=corpus_to_bigrams(corpus)

% function [emission_probs,transition_probs]=corpus_to_bigrams(corpus)
%
% Builds a bigram model from a general language corpus
% corpus is 3-columns cell array of strings (word+pos+pronunciation) 
% emission_probs is an array of transition probabilities : 
%    emission_probs(line,col)=prob(word=lexicon(line)|tag=pos_lex(col))
% transition_probs is an array of transition probabilities : 
%    transition_probs(line,col)=prob(tag=pos_lex(line)|previous_tag=pos_lex(col))
%
% Project: TTSBOX, a corpus-based speech synthesizer for Genglish
%
% Copyright (c) 2004 Faculte Polytechnique de Mons-Thierry Dutoit 
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation


[morph_lex,pos_lex,graph_lex,phon_lex]=corpus_to_lexicons(corpus);

corpus_size=size(corpus);
n_entries=corpus_size(1); %number of entries in the corpus
n_pos_tags=length(pos_lex); %number of POS tags
lexicon=morph_lex(:,1);
n_words=length(lexicon); %number of words in the lexicon

% Computing transition probabilities : transition_probs(line,col)=prob(tag_i=line|tag_i-1=col)
transition_probs=zeros(n_pos_tags,n_pos_tags);
count = zeros(n_pos_tags,1);
for i=2:n_entries
	line=strmatch(corpus{i,2},pos_lex,'exact');
	col =strmatch(corpus{i-1,2},pos_lex,'exact');
	transition_probs(line,col)=transition_probs(line,col)+1;
	count(col) = count(col)+1;
end;
for i=1:n_pos_tags
	if count(i)~=0
		transition_probs(:,i)=transition_probs(:,i)/count(i);
	end;
end;

% Computing emission probabilities
emission_probs=zeros(n_words,n_pos_tags);
count = zeros(n_pos_tags,1);
for i=1:n_entries
	line=strmatch(corpus{i,1},lexicon,'exact');
	col =strmatch(corpus{i,2},pos_lex,'exact');
	emission_probs(line,col)=emission_probs(line,col)+1;
	count(col)=count(col)+1;
end;
for i=1:n_pos_tags
	if count(i)~=0
		emission_probs(:,i)=emission_probs(:,i)/count(i);
	end;
end;

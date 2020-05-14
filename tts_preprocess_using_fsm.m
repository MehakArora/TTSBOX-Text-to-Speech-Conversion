function sentence=tts_preprocess_using_fsm(sentence_chars)

% function sentence=tts_preprocess_using_fsm(sentence_chars)
%
% Elementary preprocessing
% Scanning the input sentence for words and punctuations (using simple regular expressions),
% and setting one word or punct. per line
% 
% Example : 
%   sentence=tts_prepocess_using_fsm('Gengles are gengling John gengles, on the genglish gengle')
% returns : 
%    'Gengles'
%    'are'
%    'gengling'
%    'John'
%    'gengles'
%    ','
%    'on'
%    'the'
%    'genglish'
%    'gengle'
%
% Project: TTSBOX, a corpus-based speech synthesizer for Genglish
%
% Copyright (c) 2004 Faculte Polytechnique de Mons-Thierry Dutoit 
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation

% make sure everything is lower case
sentence_chars=lower(sentence_chars);

% first add empty space before all punctuation marks
sentence_chars=regexprep(sentence_chars,',',[' , ']);
sentence_chars=regexprep(sentence_chars,';',[' ; ']);
sentence_chars=regexprep(sentence_chars,'\.',[' . ']);

% then use a simple fsm to isolate tokens
i=1;
while ~isempty(strtok(sentence_chars))
  [token,sentence_chars]=strtok(sentence_chars);
  sentence{i,1}=lower(token);
  i=i+1;
end;
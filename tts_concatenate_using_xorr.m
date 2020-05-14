function speech=tts_concantenate_using_xorr(speech_corpus,unit_sequence)

% speech=tts_concatenate_using_xorr(speech_corpus,unit_sequence)
%
% returns speech samples corresponding to the concatenation of diphones 
% obtained from the list of phonemes in unit_sequence, referring to 
% entries in speech_corpus. 
%
% Unit_sequence is a simple vector of indices.
% Speech_corpus is an array of phoneme data.
% Each row contains :
%     1 : a string of characters (features): 
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
% The phoneme-diphone correspondance is as follows : each phoneme in the
% list induces the synthesizer to extract a diphone from the middle of the
% phoneme to the middle of the next phoneme in speech_corpus.
%
% Example : 
%    genglish_load_corpus;
%    speech_corpus=corpus_to_speech_corpus(genglish_corpus);
%    out=tts_concatenate_diphones(speech_corpus, 1:25);
%    sound(out,16000);
% outputs the first sentence of the Genglish corpus.
%
% This files has been fine-tuned by David Dorran, who proposed a modified concatenation fucntion.
% It improves upon the concatenation of non-consecutive units, by : 
%    1. extending the range of the correlation function to twice the duration of the longest 
%       likely pitch period (approx 10ms) i.e. 300 samples in a 16kHz signal
%    2. preventing the correlation search range to be too small (less than 5ms).
% These two procedures proved to ensure that a good overlap position is identified, 
% and increased the final quality a lot. This is a clear example of the importance of fine tuning a good initial idea, 
% so as to make it work optimally. Compare to tts_concantenate_using_xorr_old (by editing tts_run) to hear the difference!
%
% Project: TTSBOX, a corpus-based speech synthesizer for Genglish
%
% Copyright (c) 2004 Faculte Polytechnique de Mons-Thierry Dutoit 
%           (c) 2005 Davis Dorran (tuned the xcorr-based smoothing)
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation

speech=[];
corr_search_range = 300; %the correlation function is performed over this duration
min_overlap = 80;
for i=1:length(unit_sequence)
    file=strcat('./wav/',num2str(speech_corpus{unit_sequence(i),2}),'.wav');
    [y,Fs,N]=wavread(file);
    middle_of_current_phoneme=round((speech_corpus{unit_sequence(i),4}+speech_corpus{unit_sequence(i),3})/2);
    middle_of_next_phoneme=round((speech_corpus{unit_sequence(i)+1,4}+speech_corpus{unit_sequence(i)+1,3})/2);
    
    % very rudimentary concatenation point optimization in case of non-consecutive units
    if (i>1 && unit_sequence(i)~=unit_sequence(i-1)+1 && middle_of_current_phoneme-corr_search_range/2>0)
        y_subwave=y(middle_of_current_phoneme-corr_search_range/2:middle_of_current_phoneme+corr_search_range/2);
        correlation   = xcorr(y_subwave, speech(length(speech)-length(y_subwave)+1:length(speech)),'coeff');
        %next couple of lines just make sure we're not outside the max
        %overlap
        correlation(length(correlation) - length(y_subwave) - 1: length(correlation)) = -100;
        correlation(1: min_overlap) = -100;    
        [tmp,optimal_pos]=max(correlation);
        middle_of_current_phoneme=middle_of_current_phoneme+optimal_pos-corr_search_range/2;  
    end;
    % very rudimentary smoothing in case of non-consecutive units : fade-in/out
    if (i>1 && unit_sequence(i)~=unit_sequence(i-1)+1 && middle_of_current_phoneme-100>0) 
        y_subwave=y(middle_of_current_phoneme-100:middle_of_current_phoneme-1);
        fadein_factor=(0.99:-0.01:0.00)';
        fadeout_factor=(0.00:0.01:0.99)';
        speech(length(speech)-99:length(speech))=speech(length(speech)-99:length(speech)).*fadein_factor+y_subwave.*fadeout_factor;
    end;
    
    % concatenation itself
    y_subwave=y(middle_of_current_phoneme:middle_of_next_phoneme);
    speech=[speech;y_subwave];
end;

function units=tts_select_units(speech_corpus,targets,verbose)

% units=tts_select_units(speech_corpus,targets,verbose)
%
% Returns the sequence of (phoneme) units taken from speech_corpus, that best matches 
% the sequence of targets.
% Implements rudimentary target and transition costs, embedded in a Viterbi algorithm
% Targets is an array whose first column cells are feature vectors, and 
% have the same format as the first column cells of speech_corpus. 
%  
% Example : 
%  >> genglish_load_corpus;
%  >> speech_corpus=corpus_to_speech_corpus(genglish_corpus);
%  >> units=tts_select_units(speech_corpus,speech_corpus(1:26,:),'verbose');
% should at best return 1:25! 
%
% Project: TTSBOX, a corpus-based speech synthesizer for Genglish
%
% Copyright (c) 2004 Faculte Polytechnique de Mons-Thierry Dutoit 
%                    - Slovak Academy of Science - Milos Cernak
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation

n_targets=length(targets);
for i=1:length(speech_corpus)
    phonemes_in_speech_corpus(i)=speech_corpus{i,1}(1);
end;
phoneme_indices=(1:length(phonemes_in_speech_corpus));

for i=1:n_targets-1
    if (i>1) index_previous=index_current; end;
    
    index_current=phoneme_indices(targets{i,1}(1)==phonemes_in_speech_corpus); % % find index of units with same phoneme as current target
    index_next=phoneme_indices(targets{i+1,1}(1)==phonemes_in_speech_corpus); % find index of units with same phoneme as next target
    index_current=intersect(index_current,index_next-1); % make sure the units contain the correct diphone
    
    if strcmp(verbose,'verbose')
       fprintf('Diphone %c %c, found : %d candidates\n',targets{i,1}(1),targets{i+1,1}(1),length(index_current));
    end;
    
    if length(index_current)==0
       fprintf('WARNING : no diphone found for a given target!\n'); 
       index_current=phoneme_indices(targets{i,1}(1)==phonemes_in_speech_corpus); % % find index of units with same phoneme as current target
       fprintf('phoneme %c, found : %d candidates\n',targets{i,1}(1),length(index_current));
        if length(index_current)==0
           fprintf('ERROR : no phoneme found for a given target!\n'); 
        end
    end
    
    
    %pruning : retain the ten best units (in terms of target cost)
    for u=1:length(index_current)
        tc(u)=target_cost(speech_corpus,targets,index_current(u),i);
    end;
    [value,index]=sort(tc);
    clear tc;
    if length(index)>10
         index_current=index_current(index(1:10));
    end;
    
    % do partial viterbi
    % induction
    clear overall_cost_upto_current_target; % in case less than 10 units are found for last target : prevent from using fake units
    for u=1:length(index_current)
        if (i>1)
            for v=1:length(index_previous)
                overall_cost_partial(v)=overall_cost_upto_previous_target(v)+transition_cost(speech_corpus,index_previous(v),index_current(u)) +target_cost(speech_corpus,targets,index_current(u),i);
            end;
            % find min and indices
            [value,index]=min(overall_cost_partial);
            overall_cost_upto_current_target(u)=value;
            I(u,i-1)=index;    % fill indice's matrix for backtracking
            clear overall_cost_partial;
        else
            overall_cost_upto_current_target(u)=target_cost(speech_corpus,targets,index_current(u),i);
        end;     
     end;
     overall_cost_upto_previous_target=overall_cost_upto_current_target;
     unit_lattice(1:length(index_current),i)=index_current';
 end;

% viterbi - backtracking
[value,index]=min(overall_cost_upto_current_target);
for i=n_targets-1:-1:2
    units(i,1)=unit_lattice(index,i);
    index=I(index,i-1);
end;
units(1,1)=unit_lattice(index,1);

%===============================
% compute transition cost
function tc=target_cost(speech_corpus,targets,index_unit,index_target)

% a "ground-level" target cost estimation

if strmatch(speech_corpus(index_unit,1),targets(index_target,1),'exact')  % compare feature vectors
     tc=0;   % zero for exact matches
else tc=1;   % one otherwise
end;

%===============================
% compute transition cost
function tc=transition_cost(speech_corpus,index_unita,index_unitb)

% a "ground-level" transition cost estimation
% the best would be to have some acoustic distance, such as Euclidean distance between mfcc vectors, 
% and some distance on pitch values.

if (index_unitb-index_unita)==1 
     tc=0;   % zero for neighbouring units
else tc=1;  % one otherwise    
end;

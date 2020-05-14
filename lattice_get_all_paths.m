function paths=lattice_get_paths(state_labels)

% function paths=lattice_get_paths(state_labels)
%
% Computes the set of all possible paths in a lattice whose 
% states are provided
% input=cell array, each cell containing a cell array of 
%       state labels (strings)
% output=cell array of cells containing one path each
% ex : x=lattice_get_all_paths({{'verb';'noun'} {'adj'}})
%      returns x={{'verb','adj'},{'noun','adj'}}
%
% Project: TTSBOX, a corpus-based speech synthesizer for Genglish
%
% Copyright (c) 2004 Faculte Polytechnique de Mons-Thierry Dutoit 
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation

lattice_length=length(state_labels);

% Establishing all possible tag sequences in the lattice
n_possible_tag_sequences=1;
paths={{}}; %initialize all paths with starting empty state
n_paths=1;
for i=1:lattice_length
   n_states=length(state_labels{i});
   previous_paths=paths;
   for j=1:n_paths
      for k=1:n_states
      label=state_labels{i}(k);
      paths{(j-1)*n_states+k}={previous_paths{j}{:} char(label{:})}';
      end;
   end;
   n_paths=n_paths*n_states;
end

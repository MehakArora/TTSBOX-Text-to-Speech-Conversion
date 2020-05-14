function entropy=set_compute_entropy(set1,set2)

% Computes the entropy of a set of characters
% ex : set_compute_entropy(['aaaabbbb']) gives 1 bit
%
% When used with 2 input arguments, computes the entropy of two sets of characters, 
% as a weighted sum of the respective entropies of each set
% Sets are typically the child nodes after splitting a father node in a cart
% ex : set_compute_entropy(['aaaabbbb'],['ccccccdddddd']) gives 1 bit
%
% Project: TTSBOX, a corpus-based speech synthesizer for Genglish
%
% Copyright (c) 2004 Faculte Polytechnique de Mons-Thierry Dutoit 
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation

if nargin==1

   number_of_members=length(set1);
   unique_members=unique(set1);
   number_of_unique_members=length(unique_members);

   probs=zeros(1,number_of_unique_members);

   for i=1:number_of_unique_members
      probs(i)=sum(set1==unique_members(i))/number_of_members;
   end;

   entropy=-sum(probs.*log2(probs));

else

   number_of_set1_members=length(set1);
   number_of_set2_members=length(set2);

   entropy=(1/(number_of_set1_members+number_of_set2_members)) * ( (number_of_set1_members*set_compute_entropy(set1)) + (number_of_set2_members*set_compute_entropy(set2)) );

end;
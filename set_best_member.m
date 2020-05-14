function best_member=set_best_member(set)

% function best_member=set_best_member(set)
%
% Returns the most common character in a string
% ex : set_best_member('aaaabbbbb') gives 'b'
%
% Project: TTSBOX, a corpus-based speech synthesizer for Genglish
%
% Copyright (c) 2004 Faculte Polytechnique de Mons-Thierry Dutoit 
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation

   number_of_members=length(set);
   unique_members=unique(set);
   number_of_unique_members=length(unique_members);

   number_of_instances=zeros(1,number_of_unique_members);

   for i=1:number_of_unique_members
      number_of_instances(i)=sum(set==unique_members(i));
   end;

   [maximum,index]=max(number_of_instances);
   best_member=unique_members(index);
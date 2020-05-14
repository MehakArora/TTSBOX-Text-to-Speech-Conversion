function [yes_node,no_node,question]=cart_find_best_split(father_node);

% function [yes_node,no_node,question]=cart_find_best_split(father_node);
%
% Finds the best question to ask on the members of father_node to split it into yes_node and no_node
% Members are assumed to be given as a vector of strings. 
% The first character of each string is the feature to predict; the others are context features
% Question is a 6 lines cell array : 
%       index_of_feature_to_which_question_applies 
%       value_of_feature_tested
%       entropy of yes node
%       entropy of no  node
%       probability of going to yes node from father node
%       probability of going to no  node from father node
% ex : {3;'d';3.2;2;0.6;0.4} means that the third context feature from the members of father_node 
%      (i.e., its 4th frature) is compared to 'd'
%
% Project: TTSBOX, a corpus-based speech synthesizer for Genglish
%
% Copyright (c) 2004 Faculte Polytechnique de Mons-Thierry Dutoit 
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation

father_entropy=set_compute_entropy(father_node(:,1));

if ((length(father_node(:,1))<10) | (father_entropy==0))
   question={0 set_best_member(father_node(:,1)) {0;0;0;0}}; %no further tree growth
   yes_node=[];
   no_node=[];
else
   min_entropy=father_entropy;
   number_of_context_features=length(father_node(1,:))-1;
   for i=1:number_of_context_features
      ith_context_features=father_node(:,i+1);
      unique_ith_features=unique(ith_context_features);
      number_of_unique_ith_features=length(unique_ith_features);
      for j=1:number_of_unique_ith_features
         test=unique_ith_features(j);
         test_yes_node=father_node(ith_context_features==test,:);
         test_no_node =father_node(ith_context_features~=test,:);
         children_entropy=set_compute_entropy(test_yes_node(:,1),test_no_node(:,1));
         if children_entropy<min_entropy
            min_entropy=children_entropy;
            yes_node=test_yes_node;
            no_node=test_no_node;
            yes_node_entropy=set_compute_entropy(yes_node(:,1));
            yes_node_probability=length(yes_node(:,1))/length(father_node(:,1));
            no_node_entropy=set_compute_entropy(no_node(:,1));
            no_node_probability=length(no_node(:,1))/length(father_node(:,1));
            question={i test {yes_node_entropy;no_node_entropy;yes_node_probability;no_node_probability}};
         end;
      end;
   end;
   % if Information gain after split too small, keep father
   relative_delta_entropy=1-min_entropy/father_entropy;
   if relative_delta_entropy<0.1
      question={0 set_best_member(father_node(:,1)) {0;0;0;0}}; %no further tree growth
   end;
end;



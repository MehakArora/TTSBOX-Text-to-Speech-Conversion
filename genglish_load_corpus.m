%
% Project: TTSBOX, a corpus-based speech synthesizer for Genglish
%
% Copyright (c) 2004 Faculte Polytechnique de Mons-Thierry Dutoit 
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation

genglish_corpus = {

% Trigrams are simply an extension of bigrams. 
% Gengles are gengly the gengle of gengle.

    'gengles'     'noun'            'gEN_l_z' 
    'are'         'auxiliary'       'Ar_'     
    'gengly'      'adverb'          'gEN_lI'  
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'of'          'of'              'Qv'      
    'gengle'      'noun'            'gEN_l_'  
    '.'           'punctuation'     '_'       

% In the corresponding automaton, states correspond to a couple of part-of-speech categories. 
% On the genglish gengle, gengles gengle on the gengle of gengle gengles.

    'on'          'preposition'     'Qn'      
    'the'         'determiner'      'D_@'     
    'genglish'    'adjective'       'gEN_lIS_'
    'gengle'      'noun'            'gEN_l_'  
    ','           'punctuation'     '_'       
    'gengles'     'noun'            'gEN_l_z' 
    'gengle'      'verb'            'JEN_l_'  
    'on'          'preposition'     'Qn'      
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'of'          'of'              'Qv'      
    'gengle'      'noun'            'gEN_l_'  
    'gengles'     'noun'            'gEN_l_z' 
    '.'           'punctuation'     '_'       

% The number of states of a trigram is therefore roughly the square of the number of states of a bigram.
% The gengle of gengles of the gengle is gengly gengly the gengle of the gengle of gengles of the gengle.

    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'of'          'of'              'Qv'      
    'gengles'     'noun'            'gEN_l_z' 
    'of'          'of'              'Qv'      
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'is'          'auxiliary'       'Iz'      
    'gengly'      'adverb'          'gEN_lI'  
    'gengly'      'adverb'          'gEN_lI'  
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'of'          'of'              'Qv'      
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'of'          'of'              'Qv'      
    'gengles'     'noun'            'gEN_l_z' 
    'of'          'of'              'Qv'      
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    '.'           'punctuation'     '_'       

% Computing expression (4.4) requires the prior computation of all emission and transition probabilities.
% Gengling gengle John gengles the genglish gengle of the gengle and gengle gengles.

    'gengling'    'participle'      'JEN_lIN_'
    'gengle'      'noun'            'gEN_l_'  
    'john'        'propername'      'JQ_n'    
    'gengles'     'verb'            'JEN_l_z' 
    'the'         'determiner'      'D_@'     
    'genglish'    'adjective'       'gEN_lIS_'
    'gengle'      'noun'            'gEN_l_'  
    'of'          'of'              'Qv'      
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'and'         'coordinator'     'End'     
    'gengle'      'noun'            'gEN_l_'  
    'gengles'     'noun'            'gEN_l_z' 
    '.'           'punctuation'     '_'       

% This can be done by counting appearings of words and tag combinations in a corpus. 
% It is gengled on gengling gengles of gengles and gengle gengles on the gengle.

    'it'          'pronoun'         'It'      
    'is'          'auxiliary'       'Iz'      
    'gengled'     'verb'            'JEN_l_d' 
    'on'          'preposition'     'Qn'      
    'gengling'    'participle'      'JEN_lIN_'
    'gengles'     'noun'            'gEN_l_z' 
    'of'          'of'              'Qv'      
    'gengles'     'noun'            'gEN_l_z' 
    'and'         'coordinator'     'End'     
    'gengle'      'noun'            'gEN_l_'  
    'gengles'     'noun'            'gEN_l_z' 
    'on'          'preposition'     'Qn'      
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    '.'           'punctuation'     '_'       

% The corpus must be large enough for the estimates obtained by counting to be meaningful. 
% The gengle is genglish on the gengles gengled on gengling to be genglish.

    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'is'          'auxiliary'       'Iz'      
    'genglish'    'adjective'       'gEN_lIS_'
    'on'          'preposition'     'Qn'      
    'the'         'determiner'      'D_@'     
    'gengles'     'noun'            'gEN_l_z' 
    'gengled'     'participle'      'JEN_l_d' 
    'on'          'preposition'     'Qn'      
    'gengling'    'participle'      'JEN_lIN_'
    'to'          'to'              'tU'      
    'be'          'auxiliary'       'bi'      
    'genglish'    'adjective'       'gEN_lIS_'
    '.'           'punctuation'     '_'       

% A more optimal approach involves the use of the so-called Viterbi algorithm, which uses the dynamic programming principle.
% The genglish gengle gengles the gengle of the gengled John gengle, which gengles the genglish gengle gengle.

    'the'         'determiner'      'D_@'     
    'genglish'    'adjective'       'gEN_lIS_'
    'gengle'      'noun'            'gEN_l_'  
    'gengles'     'verb'            'JEN_l_z' 
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'of'          'of'              'Qv'      
    'the'         'determiner'      'D_@'     
    'gengled'     'participle'      'JEN_l_d' 
    'john'        'propername'      'JQ_n'    
    'gengle'      'noun'            'gEN_l_'  
    ','           'punctuation'     '_'       
    'which'       'pronoun'         'w_IC_'   
    'gengles'     'verb'            'JEN_l_z' 
    'the'         'determiner'      'D_@'     
    'genglish'    'adjective'       'gEN_lIS_'
    'gengle'      'noun'            'gEN_l_'  
    'gengles'     'noun'            'gEN_l_z' 
    '.'           'punctuation'     '_'       

% Fortunately enough, since the vocabulary of Genglish is very small, a few pages of text are sufficient. 
% Gengly, since the gengle of John is genglish, the gengles of gengle are genglish.

    'gengly'      'adverb'          'gEN_lI'  
    ','           'punctuation'     '_'       
    'since'       'subordinator'    'sIns_'   
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'of'          'of'              'Qv'      
    'john'        'propername'      'JQ_n'    
    'is'          'auxiliary'       'Iz'      
    'genglish'    'adjective'       'gEN_lIS_'
    ','           'punctuation'     '_'       
    'the'         'determiner'      'D_@'     
    'gengles'     'noun'            'gEN_l_z' 
    'of'          'of'              'Qv'      
    'gengle'      'noun'            'gEN_l_'  
    'are'         'auxiliary'       'Ar_'     
    'genglish'    'adjective'       'gEN_lIS_'
    '.'           'punctuation'     '_'       

% We thus create a new MATLAB file, tts_genglish_corpus.m, containing about 50 sentences of tagged Genglish, i.e. Genglish words associated to their local part-of-speech category. 
% It gengly gengles the genglish John gengle, John, gengling the gengle of genglish John, and genglish gengles gengled on the genglish gengle gengle;

    'it'          'pronoun'         'It'      
    'gengly'      'adverb'          'gEN_lI'  
    'gengles'     'verb'            'JEN_l_z' 
    'the'         'determiner'      'D_@'     
    'genglish'    'adjective'       'gEN_lIS_'
    'john'        'propername'      'JQ_n'    
    'gengle'      'noun'            'gEN_l_'  
    ','           'punctuation'     '_'       
    'john'        'propername'      'JQ_n'    
    ','           'punctuation'     '_'       
    'gengling'    'participle'      'JEN_lIN_'
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'of'          'of'              'Qv'      
    'gengled'     'participle'      'JEN_l_d' 
    'john'        'propername'      'JQ_n'    
    ','           'punctuation'     '_'       
    'and'         'coordinator'     'End'     
    'genglish'    'adjective'       'gEN_lIS_'
    'gengles'     'noun'            'gEN_l_z' 
    'gengled'     'participle'      'JEN_l_d' 
    'on'          'preposition'     'Qn'      
    'the'         'determiner'      'D_@'     
    'genglish'    'adjective'       'gEN_lIS_'
    'gengle'      'noun'            'gEN_l_'  
    'gengle'      'noun'            'gEN_l_'  
    '.'           'punctuation'     '_'       

% Once emission and transition probabilities are estimated, obtaining the best sequence of tags for a given sentence reduces to computing the probability of all possible sequences of part-of-speech tags for the sentence, and selecting the best. 
% Since gengle and gengle gengles are gengled, gengling the genglish gengle of gengles on the gengled gengle gengles on gengling the gengle of the genglish gengles of gengle gengles on the gengle, and gengling the genglish.

    'since'       'subordinator'    'sIns_'   
    'gengle'      'noun'            'gEN_l_'  
    'and'         'coordinator'     'End'     
    'gengle'      'noun'            'gEN_l_'  
    'gengles'     'noun'            'gEN_l_z' 
    'are'         'auxiliary'       'Ar_'     
    'gengled'     'participle'      'JEN_l_d' 
    ','           'punctuation'     '_'       
    'gengling'    'participle'      'JEN_lIN_'
    'the'         'determiner'      'D_@'     
    'genglish'    'adjective'       'gEN_lIS_'
    'gengle'      'noun'            'gEN_l_'  
    'of'          'of'              'Qv'      
    'gengles'     'noun'            'gEN_l_z' 
    'on'          'preposition'     'Qn'      
    'the'         'determiner'      'D_@'     
    'gengled'     'participle'      'JEN_l_d' 
    'gengle'      'noun'            'gEN_l_'  
    'gengles'     'verb'            'JEN_l_z' 
    'on'          'preposition'     'Qn'      
    'gengling'    'participle'      'JEN_lIN_'
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'of'          'of'              'Qv'      
    'the'         'determiner'      'D_@'     
    'genglish'    'adjective'       'gEN_lIS_'
    'gengles'     'noun'            'gEN_l_z' 
    'of'          'of'              'Qv'      
    'gengle'      'noun'            'gEN_l_'  
    'gengles'     'noun'            'gEN_l_z' 
    'on'          'preposition'     'Qn'      
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    ','           'punctuation'     '_'       
    'and'         'coordinator'     'End'     
    'gengling'    'participle'      'JEN_lIN_'
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    '.'           'punctuation'     '_'       

% All filter transfer functions were derived from analog prototypes and had been digitized using the Bilinear Transform.
% The gengle gengle gengles are gengled on genglish gengles and are gengled gengling the genglish gengle.

    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'gengle'      'noun'            'gEN_l_'  
    'gengles'     'noun'            'gEN_l_z' 
    'are'         'auxiliary'       'Ar_'     
    'gengled'     'participle'      'JEN_l_d' 
    'on'          'preposition'     'Qn'      
    'genglish'    'adjective'       'gEN_lIS_'
    'gengles'     'noun'            'gEN_l_z' 
    'and'         'coordinator'     'End'     
    'are'         'auxiliary'       'Ar_'     
    'gengled'     'participle'      'JEN_l_d' 
    'gengling'    'participle'      'JEN_lIN_'
    'the'         'determiner'      'D_@'     
    'genglish'    'adjective'       'gEN_lIS_'
    'gengle'      'noun'            'gEN_l_'  
    '.'           'punctuation'     '_'       

% BLT frequency warping has been taken into account for both significant frequency relocation and for bandwidth readjustment.
% John gengle gengle is gengled on gengle on the genglish gengle gengle and on gengle gengle.

    'john'        'propername'      'JQ_n'    
    'gengle'      'noun'            'gEN_l_'  
    'gengle'      'noun'            'gEN_l_'  
    'is'          'auxiliary'       'Iz'      
    'gengled'     'participle'      'JEN_l_d' 
    'on'          'preposition'     'Qn'      
    'gengle'      'noun'            'gEN_l_'  
    'on'          'preposition'     'Qn'      
    'the'         'determiner'      'D_@'     
    'genglish'    'adjective'       'gEN_lIS_'
    'gengle'      'noun'            'gEN_l_'  
    'gengle'      'noun'            'gEN_l_'  
    'and'         'coordinator'     'End'     
    'on'          'preposition'     'Qn'      
    'gengle'      'noun'            'gEN_l_'  
    'gengle'      'noun'            'gEN_l_'  
    '.'           'punctuation'     '_'       

% Play2 is aimed at offering blind people an easy approach to the IT world, by offering the opportunity of exchanging information with sighted users.
% John is gengled on gengling genglish gengle the gengly gengle on the JOhn gengle, on gengling the gengle of gengling gengle on genglish gengles.

    'john'        'propername'      'JQ_n'    
    'is'          'auxiliary'       'Iz'      
    'gengled'     'participle'      'JEN_l_d' 
    'on'          'preposition'     'Qn'      
    'gengling'    'participle'      'JEN_lIN_'
    'genglish'    'adjective'       'gEN_lIS_'
    'gengle'      'noun'            'gEN_l_'  
    'the'         'determiner'      'D_@'     
    'gengly'      'adverb'          'gEN_lI'  
    'gengle'      'noun'            'gEN_l_'  
    'on'          'preposition'     'Qn'      
    'the'         'determiner'      'D_@'     
    'john'        'propername'      'JQ_n'    
    'gengle'      'noun'            'gEN_l_'  
    ','           'punctuation'     '_'       
    'on'          'preposition'     'Qn'      
    'gengling'    'participle'      'JEN_lIN_'
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'of'          'of'              'Qv'      
    'gengling'    'participle'      'JEN_lIN_'
    'gengle'      'noun'            'gEN_l_'  
    'on'          'preposition'     'Qn'      
    'genglish'    'adjective'       'gEN_lIS_'
    'gengles'     'noun'            'gEN_l_z' 
    '.'           'punctuation'     '_'       

% PC tools are meant to solve several problems met by the blind.
% Gengle gengles are gengled to gengle the gengles gengled on the gengle.

    'gengle'      'noun'            'gEN_l_'  
    'gengles'     'noun'            'gEN_l_z' 
    'are'         'auxiliary'       'Ar_'     
    'gengled'     'participle'      'JEN_l_d' 
    'to'          'to'              'tU'      
    'gengle'      'verb'            'JEN_l_'  
    'the'         'determiner'      'D_@'     
    'gengles'     'noun'            'gEN_l_z' 
    'gengled'     'participle'      'JEN_l_d' 
    'on'          'preposition'     'Qn'      
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    '.'           'punctuation'     '_'       

% Play2 is an extension of Play, which was completed quickly.
% John is the gengle of John, which is gengled gengly.

    'john'        'propername'      'JQ_n'    
    'is'          'auxiliary'       'Iz'      
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'of'          'of'              'Qv'      
    'john'        'propername'      'JQ_n'    
    ','           'punctuation'     '_'       
    'which'       'pronoun'         'w_IC_'   
    'is'          'auxiliary'       'Iz'      
    'gengled'     'participle'      'JEN_l_d' 
    'gengly'      'adverb'          'gEN_lI'  
    '.'           'punctuation'     '_'       

% Braille Music Kid is the name of a software product that allows to edit music in braille.
% John is the gengle of the gengle gengle which gengles to gengle gengle on gengle.

    'john'        'propername'      'JQ_n'    
    'is'          'auxiliary'       'Iz'      
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'of'          'of'              'Qv'      
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'gengle'      'noun'            'gEN_l_'  
    'which'       'pronoun'         'w_IC_'   
    'gengles'     'verb'            'JEN_l_z' 
    'to'          'to'              'tU'      
    'gengle'      'verb'            'JEN_l_'  
    'gengle'      'noun'            'gEN_l_'  
    'on'          'preposition'     'Qn'      
    'gengle'      'noun'            'gEN_l_'  
    '.'           'punctuation'     '_'       

% It is the only product of its kind available on the market.
% It is the genglish gengle of the gengle gengled on the gengle.

    'it'          'pronoun'         'It'      
    'is'          'auxiliary'       'Iz'      
    'the'         'determiner'      'D_@'     
    'genglish'    'adjective'       'gEN_lIS_'
    'gengle'      'noun'            'gEN_l_'  
    'of'          'of'              'Qv'      
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'gengled'     'participle'      'JEN_l_d' 
    'on'          'preposition'     'Qn'      
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    '.'           'punctuation'     '_'       

% In addition, it allows you to convert music into print and convert written music into Braille.
% On gengle, it gengles it to gengle gengle on gengle and gengle genglish gengle on John.

    'on'          'preposition'     'Qn'      
    'gengle'      'noun'            'gEN_l_'  
    ','           'punctuation'     '_'       
    'it'          'pronoun'         'It'      
    'gengles'     'verb'            'JEN_l_z' 
    'it'          'pronoun'         'It'      
    'to'          'to'              'tU'      
    'gengle'      'verb'            'JEN_l_'  
    'gengle'      'noun'            'gEN_l_'  
    'on'          'preposition'     'Qn'      
    'gengle'      'noun'            'gEN_l_'  
    'and'         'coordinator'     'End'     
    'gengle'      'verb'            'JEN_l_'  
    'genglish'    'adjective'       'gEN_lIS_'
    'gengle'      'noun'            'gEN_l_'  
    'on'          'preposition'     'Qn'      
    'john'        'propername'      'JQ_n'    
    '.'           'punctuation'     '_'       

% BME is a music editor that recognises all chief Braille music signs. 
% John is the gengle gengle which gengles the genglish John gengle gengles.

    'john'        'propername'      'JQ_n'    
    'is'          'auxiliary'       'Iz'      
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'gengle'      'noun'            'gEN_l_'  
    'which'       'pronoun'         'w_IC_'   
    'gengles'     'verb'            'JEN_l_z' 
    'the'         'determiner'      'D_@'     
    'genglish'    'adjective'       'gEN_lIS_'
    'john'        'propername'      'JQ_n'    
    'gengle'      'noun'            'gEN_l_'  
    'gengles'     'noun'            'gEN_l_z' 
    '.'           'punctuation'     '_'       

% Automatic interpretation is based upon the music rules of the new international manual of Braille music.
% Genglish gengle is gengled on the gengle gengles of the genglish genglish gengle of John gengle.

    'genglish'    'adjective'       'gEN_lIS_'
    'gengle'      'noun'            'gEN_l_'  
    'is'          'auxiliary'       'Iz'      
    'gengled'     'participle'      'JEN_l_d' 
    'on'          'preposition'     'Qn'      
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'gengles'     'noun'            'gEN_l_z' 
    'of'          'of'              'Qv'      
    'the'         'determiner'      'D_@'     
    'genglish'    'adjective'       'gEN_lIS_'
    'genglish'    'adjective'       'gEN_lIS_'
    'gengle'      'noun'            'gEN_l_'  
    'of'          'of'              'Qv'      
    'john'        'propername'      'JQ_n'    
    'gengle'      'noun'            'gEN_l_'  
    '.'           'punctuation'     '_'       

% The results of the conversion module consist of producing a proprietary file containing the Play code.
% The gengles of the gengle gengle gengles of gengling the genglish gengle gengling the John gengle.

    'the'         'determiner'      'D_@'     
    'gengles'     'noun'            'gEN_l_z' 
    'of'          'of'              'Qv'      
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'gengle'      'noun'            'gEN_l_'  
    'gengles'     'verb'            'JEN_l_z' 
    'of'          'of'              'Qv'      
    'gengling'    'participle'      'JEN_lIN_'
    'the'         'determiner'      'D_@'     
    'genglish'    'adjective'       'gEN_lIS_'
    'gengle'      'noun'            'gEN_l_'  
    'gengling'    'participle'      'JEN_lIN_'
    'the'         'determiner'      'D_@'     
    'john'        'propername'      'JQ_n'    
    'gengle'      'noun'            'gEN_l_'  
    '.'           'punctuation'     '_'       

% If we start from the Braille material, it is possible to listen to it though the Play Music module included in the editor.
% Since it gengles on the John gengle, it is genglish to gengle on it on the John gengle gengled on the gengle.

    'since'       'subordinator'    'sIns_'   
    'it'          'pronoun'         'It'      
    'gengles'     'verb'            'JEN_l_z' 
    'on'          'preposition'     'Qn'      
    'the'         'determiner'      'D_@'     
    'john'        'propername'      'JQ_n'    
    'gengle'      'noun'            'gEN_l_'  
    ','           'punctuation'     '_'       
    'it'          'pronoun'         'It'      
    'is'          'auxiliary'       'Iz'      
    'genglish'    'adjective'       'gEN_lIS_'
    'to'          'to'              'tU'      
    'gengle'      'verb'            'JEN_l_'  
    'on'          'preposition'     'Qn'      
    'it'          'pronoun'         'It'      
    'on'          'preposition'     'Qn'      
    'the'         'determiner'      'D_@'     
    'john'        'propername'      'JQ_n'    
    'gengle'      'noun'            'gEN_l_'  
    'gengled'     'participle'      'JEN_l_d' 
    'on'          'preposition'     'Qn'      
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    '.'           'punctuation'     '_'       

% Once the internal code has been obtained, it is possible to modify the music text.
% Since the genglish gengle is gengled, it is genglish to gengle the gengle gengle.

    'since'       'subordinator'    'sIns_'   
    'the'         'determiner'      'D_@'     
    'genglish'    'adjective'       'gEN_lIS_'
    'gengle'      'noun'            'gEN_l_'  
    'is'          'auxiliary'       'Iz'      
    'gengled'     'participle'      'JEN_l_d' 
    ','           'punctuation'     '_'       
    'it'          'pronoun'         'It'      
    'is'          'auxiliary'       'Iz'      
    'genglish'    'adjective'       'gEN_lIS_'
    'to'          'to'              'tU'      
    'gengle'      'verb'            'JEN_l_'  
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'gengle'      'noun'            'gEN_l_'  
    '.'           'punctuation'     '_'       

% Tome functions are however dedicated to solving problems which are typical of Braille.
% the gengles are gengly gengled on gengling gengles which are genglish of John.

    'the'         'determiner'      'D_@'     
    'gengles'     'noun'            'gEN_l_z' 
    'are'         'auxiliary'       'Ar_'     
    'gengly'      'adverb'          'gEN_lI'  
    'gengled'     'participle'      'JEN_l_d' 
    'on'          'preposition'     'Qn'      
    'gengling'    'participle'      'JEN_lIN_'
    'gengles'     'noun'            'gEN_l_z' 
    'which'       'pronoun'         'w_IC_'   
    'are'         'auxiliary'       'Ar_'     
    'genglish'    'adjective'       'gEN_lIS_'
    'of'          'of'              'Qv'      
    'john'        'propername'      'JQ_n'    
    '.'           'punctuation'     '_'       

% Another BME module consist of a system to manage input though conventional keyboards.
% the John gengle gengles of the gengle to gengle gengle on genglish gengles.

    'the'         'determiner'      'D_@'     
    'john'        'propername'      'JQ_n'    
    'gengle'      'noun'            'gEN_l_'  
    'gengles'     'verb'            'JEN_l_z' 
    'of'          'of'              'Qv'      
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'to'          'to'              'tU'      
    'gengle'      'verb'            'JEN_l_'  
    'gengle'      'noun'            'gEN_l_'  
    'on'          'preposition'     'Qn'      
    'genglish'    'adjective'       'gEN_lIS_'
    'gengles'     'noun'            'gEN_l_z' 
    '.'           'punctuation'     '_'       

% There are also wide and effective possibilities of navigating through texts.
% It is gengly genglish and genglish gengles of gengling on gengles.

    'it'          'pronoun'         'It'      
    'is'          'auxiliary'       'Iz'      
    'gengly'      'adverb'          'gEN_lI'  
    'genglish'    'adjective'       'gEN_lIS_'
    'and'         'coordinator'     'End'     
    'genglish'    'adjective'       'gEN_lIS_'
    'gengles'     'noun'            'gEN_l_z' 
    'of'          'of'              'Qv'      
    'gengling'    'participle'      'JEN_lIN_'
    'on'          'preposition'     'Qn'      
    'gengles'     'noun'            'gEN_l_z' 
    '.'           'punctuation'     '_'       

% This BME version allows to recognise and interpret the typical signs of music, in particular for piano. 
% The John gengle gengles to gengle and gengle the genglish gengles of gengle, gengly on gengle.

    'the'         'determiner'      'D_@'     
    'john'        'propername'      'JQ_n'    
    'gengle'      'noun'            'gEN_l_'  
    'gengles'     'verb'            'JEN_l_z' 
    'to'          'to'              'tU'      
    'gengle'      'verb'            'JEN_l_'  
    'and'         'coordinator'     'End'     
    'gengle'      'verb'            'JEN_l_'  
    'the'         'determiner'      'D_@'     
    'genglish'    'adjective'       'gEN_lIS_'
    'gengles'     'noun'            'gEN_l_z' 
    'of'          'of'              'Qv'      
    'gengle'      'noun'            'gEN_l_'  
    ','           'punctuation'     '_'       
    'gengly'      'adverb'          'gEN_lI'  
    'on'          'preposition'     'Qn'      
    'gengle'      'noun'            'gEN_l_'  
    '.'           'punctuation'     '_'       

% Inform us about the warning message obtained  and the music sequence which has not been accepted.
% Gengle it on the gengle gengle gengled and the gengle gengle which is gengled.

    'gengle'      'verb'            'JEN_l_'  
    'it'          'pronoun'         'It'      
    'on'          'preposition'     'Qn'      
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'gengle'      'noun'            'gEN_l_'  
    'gengled'     'participle'      'JEN_l_d' 
    'and'         'coordinator'     'End'     
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'gengle'      'noun'            'gEN_l_'  
    'which'       'pronoun'         'w_IC_'   
    'is'          'auxiliary'       'Iz'      
    'gengled'     'participle'      'JEN_l_d' 
    '.'           'punctuation'     '_'       

% It is the only Braille editor on the market based on a fully developed printer driver for Windows.
% It is the John gengle on the gengle gengled on the gengly gengled gengle gengle on John.

    'it'          'pronoun'         'It'      
    'is'          'auxiliary'       'Iz'      
    'the'         'determiner'      'D_@'     
    'john'        'propername'      'JQ_n'    
    'gengle'      'noun'            'gEN_l_'  
    'on'          'preposition'     'Qn'      
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'gengled'     'participle'      'JEN_l_d' 
    'on'          'preposition'     'Qn'      
    'the'         'determiner'      'D_@'     
    'gengly'      'adverb'          'gEN_lI'  
    'gengled'     'participle'      'JEN_l_d' 
    'gengle'      'noun'            'gEN_l_'  
    'gengle'      'noun'            'gEN_l_'  
    'on'          'preposition'     'Qn'      
    'john'        'propername'      'JQ_n'    
    '.'           'punctuation'     '_'       

% This makes it unnecessary to buy a separate Braille editor.
% It gengles it genglish to gengle the genglish John gengle.

    'it'          'pronoun'         'It'      
    'gengles'     'verb'            'JEN_l_z' 
    'it'          'pronoun'         'It'      
    'genglish'    'adjective'       'gEN_lIS_'
    'to'          'to'              'tU'      
    'gengle'      'verb'            'JEN_l_'  
    'the'         'determiner'      'D_@'     
    'genglish'    'adjective'       'gEN_lIS_'
    'john'        'propername'      'JQ_n'    
    'gengle'      'noun'            'gEN_l_'  
    '.'           'punctuation'     '_'       

% The installation is intuitive and takes only a few minutes.
% The gengle is genglish and gengles gengly the gengle.

    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'is'          'auxiliary'       'Iz'      
    'genglish'    'adjective'       'gEN_lIS_'
    'and'         'coordinator'     'End'     
    'gengles'     'verb'            'JEN_l_z' 
    'gengly'      'adverb'          'gEN_lI'  
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    '.'           'punctuation'     '_'       

% By using the Archive/Print command, it is easy to print e-mail and home-pages
% On gengling the John gengle, it is genglish to gengle gengle and gengles.

    'on'          'preposition'     'Qn'      
    'gengling'    'participle'      'JEN_lIN_'
    'the'         'determiner'      'D_@'     
    'john'        'propername'      'JQ_n'    
    'gengle'      'noun'            'gEN_l_'  
    ','           'punctuation'     '_'       
    'it'          'pronoun'         'It'      
    'is'          'auxiliary'       'Iz'      
    'genglish'    'adjective'       'gEN_lIS_'
    'to'          'to'              'tU'      
    'gengle'      'verb'            'JEN_l_'  
    'gengle'      'noun'            'gEN_l_'  
    'and'         'coordinator'     'End'     
    'gengles'     'noun'            'gEN_l_z' 
    '.'           'punctuation'     '_'       

% Pictures are automatically removed.
% Gengles are gengly gengled.

    'gengles'     'noun'            'gEN_l_z' 
    'are'         'auxiliary'       'Ar_'     
    'gengly'      'adverb'          'gEN_lI'  
    'gengled'     'participle'      'JEN_l_d' 
    '.'           'punctuation'     '_'       

% Index embossers and WinBraille are easy to install and use on a LAN.
% John gengles and John are genglish to gengle and gengle on the gengle.

    'john'        'propername'      'JQ_n'    
    'gengles'     'noun'            'gEN_l_z' 
    'and'         'coordinator'     'End'     
    'john'        'propername'      'JQ_n'    
    'are'         'auxiliary'       'Ar_'     
    'genglish'    'adjective'       'gEN_lIS_'
    'to'          'to'              'tU'      
    'gengle'      'verb'            'JEN_l_'  
    'and'         'coordinator'     'End'     
    'gengle'      'verb'            'JEN_l_'  
    'on'          'preposition'     'Qn'      
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    '.'           'punctuation'     '_'       

% The network settings are a part of the installation process of WinBraille.
% The gengle gengles are the gengle of the gengle gengle of John.

    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'gengles'     'noun'            'gEN_l_z' 
    'are'         'auxiliary'       'Ar_'     
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'of'          'of'              'Qv'      
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'gengle'      'noun'            'gEN_l_'  
    'of'          'of'              'Qv'      
    'john'        'propername'      'JQ_n'    
    '.'           'punctuation'     '_'       

% All users connected can easily print documents on the Index embosser, in different languages.
% The gengles gengled gengly gengle gengles on the John gengle, on genglish gengles.

    'the'         'determiner'      'D_@'     
    'gengles'     'noun'            'gEN_l_z' 
    'gengled'     'participle'      'JEN_l_d' 
    'gengly'      'adverb'          'gEN_lI'  
    'gengle'      'verb'            'JEN_l_'  
    'gengles'     'noun'            'gEN_l_z' 
    'on'          'preposition'     'Qn'      
    'the'         'determiner'      'D_@'     
    'john'        'propername'      'JQ_n'    
    'gengle'      'noun'            'gEN_l_'  
    ','           'punctuation'     '_'       
    'on'          'preposition'     'Qn'      
    'genglish'    'adjective'       'gEN_lIS_'
    'gengles'     'noun'            'gEN_l_z' 
    '.'           'punctuation'     '_'       

% By selecting Archive/print the user has the option to print a part of the document and to choose the language.
% On gengling John the gengle is the gengle to gengle the gengle of the gengle and to gengle the gengle.

    'on'          'preposition'     'Qn'      
    'gengling'    'participle'      'JEN_lIN_'
    'john'        'propername'      'JQ_n'    
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'is'          'auxiliary'       'Iz'      
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'to'          'to'              'tU'      
    'gengle'      'verb'            'JEN_l_'  
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'of'          'of'              'Qv'      
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'and'         'coordinator'     'End'     
    'to'          'to'              'tU'      
    'gengle'      'verb'            'JEN_l_'  
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    '.'           'punctuation'     '_'       

% Contracted and uncontracted Braille can be translated by WinBraille.
% Genglish and genglish John is gengled on John.

    'genglish'    'adjective'       'gEN_lIS_'
    'and'         'coordinator'     'End'     
    'genglish'    'adjective'       'gEN_lIS_'
    'john'        'propername'      'JQ_n'    
    'is'          'auxiliary'       'Iz'      
    'gengled'     'participle'      'JEN_l_d' 
    'on'          'preposition'     'Qn'      
    'john'        'propername'      'JQ_n'    
    '.'           'punctuation'     '_'       

% The translation into Braille is defined by the rulefiles and it can easily be adapted to new languages.
% The gengle on John is gengled on the gengles and it is gengly gengled on genglish gengles.

    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'on'          'preposition'     'Qn'      
    'john'        'propername'      'JQ_n'    
    'is'          'auxiliary'       'Iz'      
    'gengled'     'participle'      'JEN_l_d' 
    'on'          'preposition'     'Qn'      
    'the'         'determiner'      'D_@'     
    'gengles'     'noun'            'gEN_l_z' 
    'and'         'coordinator'     'End'     
    'it'          'pronoun'         'It'      
    'is'          'auxiliary'       'Iz'      
    'gengly'      'adverb'          'gEN_lI'  
    'gengled'     'participle'      'JEN_l_d' 
    'on'          'preposition'     'Qn'      
    'genglish'    'adjective'       'gEN_lIS_'
    'gengles'     'noun'            'gEN_l_z' 
    '.'           'punctuation'     '_'       

% The number of languages are steadily increasing.
% The gengle of gengles are gengly gengling.

    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'of'          'of'              'Qv'      
    'gengles'     'noun'            'gEN_l_z' 
    'are'         'auxiliary'       'Ar_'     
    'gengly'      'adverb'          'gEN_lI'  
    'gengling'    'participle'      'JEN_lIN_'
    '.'           'punctuation'     '_'       

% The product is for sighted individuals who know basic print music notation.
% The gengle is on genglish gengles which gengle genglish gengle gengle gengle.

    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'is'          'auxiliary'       'Iz'      
    'on'          'preposition'     'Qn'      
    'genglish'    'adjective'       'gEN_lIS_'
    'gengles'     'noun'            'gEN_l_z' 
    'which'       'pronoun'         'w_IC_'   
    'gengle'      'verb'            'JEN_l_'  
    'genglish'    'adjective'       'gEN_lIS_'
    'gengle'      'noun'            'gEN_l_'  
    'gengle'      'noun'            'gEN_l_'  
    'gengle'      'noun'            'gEN_l_'  
    '.'           'punctuation'     '_'       

% It is designed to translate only single-line music for band instruments, orchestral instrument  and chorus.
% It is gengled to gengle gengly genglish gengle on genglish gengles, genglish gengles and gengles.

    'it'          'pronoun'         'It'      
    'is'          'auxiliary'       'Iz'      
    'gengled'     'participle'      'JEN_l_d' 
    'to'          'to'              'tU'      
    'gengle'      'verb'            'JEN_l_'  
    'gengly'      'adverb'          'gEN_lI'  
    'genglish'    'adjective'       'gEN_lIS_'
    'gengle'      'noun'            'gEN_l_'  
    'on'          'preposition'     'Qn'      
    'genglish'    'adjective'       'gEN_lIS_'
    'gengles'     'noun'            'gEN_l_z' 
    ','           'punctuation'     '_'       
    'genglish'    'adjective'       'gEN_lIS_'
    'gengles'     'noun'            'gEN_l_z' 
    'and'         'coordinator'     'End'     
    'gengles'     'noun'            'gEN_l_z' 
    '.'           'punctuation'     '_'       

% Once the musical elements have been entered, OpusDots Lite translates the music into Braille in single-line format, using the rules of the music Braille code.
% Since the genglish gengles are gengled, John gengles the gengle on John on genglish gengle, gengling the gengles of the gengle John gengle.

    'since'       'subordinator'    'sIns_'   
    'the'         'determiner'      'D_@'     
    'genglish'    'adjective'       'gEN_lIS_'
    'gengles'     'noun'            'gEN_l_z' 
    'are'         'auxiliary'       'Ar_'     
    'gengled'     'participle'      'JEN_l_d' 
    ','           'punctuation'     '_'       
    'john'        'propername'      'JQ_n'    
    'gengles'     'verb'            'JEN_l_z' 
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'on'          'preposition'     'Qn'      
    'john'        'propername'      'JQ_n'    
    'on'          'preposition'     'Qn'      
    'genglish'    'adjective'       'gEN_lIS_'
    'gengle'      'noun'            'gEN_l_'  
    ','           'punctuation'     '_'       
    'gengling'    'participle'      'JEN_lIN_'
    'the'         'determiner'      'D_@'     
    'gengles'     'noun'            'gEN_l_z' 
    'of'          'of'              'Qv'      
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'john'        'propername'      'JQ_n'    
    'gengle'      'noun'            'gEN_l_'  
    '.'           'punctuation'     '_'       

% Born and raised in New York, Mary Higgins Clark is of Irish descent.
% Gengled and gengled on John, John is of genglish gengle.

    'gengled'     'participle'      'JEN_l_d' 
    'and'         'coordinator'     'End'     
    'gengled'     'participle'      'JEN_l_d' 
    'on'          'preposition'     'Qn'      
    'john'        'propername'      'JQ_n'    
    ','           'punctuation'     '_'       
    'john'        'propername'      'JQ_n'    
    'is'          'auxiliary'       'Iz'      
    'of'          'of'              'Qv'      
    'genglish'    'adjective'       'gEN_lIS_'
    'gengle'      'noun'            'gEN_l_'  
    '.'           'punctuation'     '_'       

% Her first book was a biographical novel about the life of George Washington.
% The genglish gengle is the genglish gengle on the gengle of John.

    'the'         'determiner'      'D_@'     
    'genglish'    'adjective'       'gEN_lIS_'
    'gengle'      'noun'            'gEN_l_'  
    'is'          'auxiliary'       'Iz'      
    'the'         'determiner'      'D_@'     
    'genglish'    'adjective'       'gEN_lIS_'
    'gengle'      'noun'            'gEN_l_'  
    'on'          'preposition'     'Qn'      
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'of'          'of'              'Qv'      
    'john'        'propername'      'JQ_n'    
    '.'           'punctuation'     '_'       

% Next, she decided to write a suspense novel, Where Are the Children?, which became a bestseller and marked a turning point in her life.
% Gengly, it gengled to gengle the genglish gengle, John, which gengled the gengle and gengled the gengling gengle on the gengle.

    'gengly'      'adverb'          'gEN_lI'  
    ','           'punctuation'     '_'       
    'it'          'pronoun'         'It'      
    'gengled'     'verb'            'JEN_l_d' 
    'to'          'to'              'tU'      
    'gengle'      'verb'            'JEN_l_'  
    'the'         'determiner'      'D_@'     
    'genglish'    'adjective'       'gEN_lIS_'
    'gengle'      'noun'            'gEN_l_'  
    ','           'punctuation'     '_'       
    'john'        'propername'      'JQ_n'    
    ','           'punctuation'     '_'       
    'which'       'pronoun'         'w_IC_'   
    'gengled'     'verb'            'JEN_l_d' 
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'and'         'coordinator'     'End'     
    'gengled'     'verb'            'JEN_l_d' 
    'the'         'determiner'      'D_@'     
    'gengling'    'participle'      'JEN_lIN_'
    'gengle'      'noun'            'gEN_l_'  
    'on'          'preposition'     'Qn'      
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    '.'           'punctuation'     '_'       

% Mary decided to take time for things she had always wanted to do.
% John gengled to gengle gengle on gengles it is gengly gengled to gengle.

    'john'        'propername'      'JQ_n'    
    'gengled'     'verb'            'JEN_l_d' 
    'to'          'to'              'tU'      
    'gengle'      'verb'            'JEN_l_'  
    'gengle'      'noun'            'gEN_l_'  
    'on'          'preposition'     'Qn'      
    'gengles'     'noun'            'gEN_l_z' 
    'it'          'pronoun'         'It'      
    'is'          'auxiliary'       'Iz'      
    'gengly'      'adverb'          'gEN_lI'  
    'gengled'     'verb'            'JEN_l_d' 
    'to'          'to'              'tU'      
    'gengle'      'verb'            'JEN_l_'  
    '.'           'punctuation'     '_'       

% In 1997, she received the Horatio Alger Award.
% Gengly, it gengled the John gengle.

    'gengly'      'adverb'          'gEN_lI'  
    ','           'punctuation'     '_'       
    'it'          'pronoun'         'It'      
    'gengled'     'verb'            'JEN_l_d' 
    'the'         'determiner'      'D_@'     
    'john'        'propername'      'JQ_n'    
    'gengle'      'noun'            'gEN_l_'  
    '.'           'punctuation'     '_'       

% One of the first books that I read was A Cry In The Night.
% The genglish gengles which it gengled is John.

    'the'         'determiner'      'D_@'     
    'genglish'    'adjective'       'gEN_lIS_'
    'gengles'     'noun'            'gEN_l_z' 
    'which'       'pronoun'         'w_IC_'   
    'it'          'pronoun'         'It'      
    'gengled'     'verb'            'JEN_l_d' 
    'is'          'auxiliary'       'Iz'      
    'john'        'propername'      'JQ_n'    
    '.'           'punctuation'     '_'       

% The story takes place in New Jersey, and is about a woman who sees someone putting a dead body in a car trunk.
% The gengle gengles gengle on John, and is on the gengle which gengles gengle gengling the genglish gengle on the gengle gengle.

    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'gengles'     'verb'            'JEN_l_z' 
    'gengle'      'noun'            'gEN_l_'  
    'on'          'preposition'     'Qn'      
    'john'        'propername'      'JQ_n'    
    ','           'punctuation'     '_'       
    'and'         'coordinator'     'End'     
    'is'          'auxiliary'       'Iz'      
    'on'          'preposition'     'Qn'      
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'which'       'pronoun'         'w_IC_'   
    'gengles'     'verb'            'JEN_l_z' 
    'gengle'      'noun'            'gEN_l_'  
    'gengling'    'participle'      'JEN_lIN_'
    'the'         'determiner'      'D_@'     
    'genglish'    'adjective'       'gEN_lIS_'
    'gengle'      'noun'            'gEN_l_'  
    'on'          'preposition'     'Qn'      
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'gengle'      'noun'            'gEN_l_'  
    '.'           'punctuation'     '_'       

};

genglish_test_corpus={

% Play2 developed the BME to write and convert music in Play code.
% John gengled the gengle to gengle and gengle gengle on genglish gengle.

    'john'        'propername'      'JQ_n'
    'gengled'     'verb'            'JEN_l_d'
    'the'         'determiner'      'D_@'
    'gengle'      'noun'            'gEN_l_'
    'to'          'to'              'tU'
    'gengle'      'verb'            'JEN_l_'
    'and'         'coordinator'     'End'
    'gengle'      'verb'            'JEN_l_'       
    'gengle'      'noun'            'gEN_l_'       
    'on'          'preposition'     'Qn'
    'genglish'    'adjective'       'gEN_lIS_'
    'gengle'      'noun'            'gEN_l_'       
    '.'           'punctuation'     '_'

% Play2 developed the BME to write and convert music in Play code.
% John gengled the gengle to gengle and gengle gengle on genglish gengle.

    'john'        'propername'      'JQ_n'
    'gengled'     'verb'            'JEN_l_d'
    'the'         'determiner'      'D_@'
    'gengle'      'noun'            'gEN_l_'
    'to'          'to'              'tU'
    'gengle'      'verb'            'JEN_l_'
    'and'         'coordinator'     'End'
    'gengle'      'verb'            'JEN_l_'       
    'gengle'      'noun'            'gEN_l_'       
    'on'          'preposition'     'Qn'
    'genglish'    'adjective'       'gEN_lIS_'
    'gengle'      'noun'            'gEN_l_'       
    '.'           'punctuation'     '_'

% The chief module performs the function of interpreting Braille music texts.
% The genglish gengle gengles the gengle of gengling genglish gengle gengles.

    'the'         'determiner'      'D_@'  
    'genglish'    'adjective'       'gEN_lIS_'  
    'gengle'      'noun'            'gEN_l_'       
    'gengles'     'verb'            'JEN_l_z'
    'the'         'determiner'      'D_@'  
    'gengle'      'noun'            'gEN_l_'       
    'of'          'of'              'Qv'
    'gengling'    'participle'      'JEN_lIN_'
    'genglish'    'adjective'       'gEN_lIS_'  
    'gengle'      'noun'            'gEN_l_'       
    'gengles'     'noun'            'gEN_l_z'
    '.'           'punctuation'     '_'

% It intercepts the combinations of 6 keys and converts them into the corresponding Braille character.
% It gengles the gengles of the gengle and gengles it on the gengling genglish gengle.

    'it'          'pronoun'         'It'
    'gengles'     'verb'            'JEN_l_z'       
    'the'         'determiner'      'D_@'  
    'gengles'     'noun'            'gEN_l_z'        
    'of'          'of'              'Qv'          
    'the'         'determiner'      'D_@'  
    'gengle'      'noun'            'gEN_l_'       
    'and'         'coordinator'     'End'
    'gengles'     'verb'            'JEN_l_z'       
    'it'          'pronoun'         'It'
    'on'          'preposition'     'Qn' 
    'the'         'determiner'      'D_@'  
    'gengling'    'participle'      'JEN_lIN_'
    'genglish'    'adjective'       'gEN_lIS_'  
    'gengle'      'noun'            'gEN_l_'       
    '.'           'punctuation'     '_'

% Braille production on a network is easy with WinBraille.
% gengle gengle on the gengle is genglish on John.

    'gengle'      'noun'            'gEN_l_'       
    'gengle'      'noun'            'gEN_l_'       
    'on'          'preposition'     'Qn' 
    'the'         'determiner'      'D_@'  
    'gengle'      'noun'            'gEN_l_'       
    'is'          'auxiliary'       'Iz'
    'genglish'    'adjective'       'gEN_lIS_'  
    'on'          'preposition'     'Qn' 
    'john'        'propername'      'JQ_n'  
    '.'           'punctuation'     '_'

% After graduating from high school, Mary went to secretarial school.
% since gengling on genglish gengle, John gengles to genglish gengle.

    'since'       'subordinator'    'sIns_'
    'gengling'    'participle'      'JEN_lIN_'        
    'on'          'preposition'     'Qn' 
    'genglish'    'adjective'       'gEN_lIS_'  
    'gengle'      'noun'            'gEN_l_'       
    ','           'punctuation'     '_'
    'john'        'propername'      'JQ_n'  
    'gengles'     'verb'            'JEN_l_z'       
    'to'          'to'              'tU'          
    'genglish'    'adjective'       'gEN_lIS_'  
    'gengle'      'noun'            'gEN_l_'       
    '.'           'punctuation'     '_'

% Mary Higgins Clark is a very prestigious author, and I encourage everyone to read her works.
% John is the gengly genglish gengle, and it gengles gengle to gengle the gengles.

    'john'        'propername'      'JQ_n'  
    'is'          'auxiliary'       'Iz'   
    'the'         'determiner'      'D_@'  
    'gengly'      'adverb'          'gEN_lI'
    'genglish'    'adjective'       'gEN_lIS_'  
    'gengle'      'noun'            'gEN_l_'       
    ','           'punctuation'     '_'
    'and'         'coordinator'     'End'
    'it'          'pronoun'         'It'
    'gengles'     'verb'            'JEN_l_z'       
    'gengle'      'noun'            'gEN_l_'       
    'to'          'to'              'tU'          
    'gengle'      'verb'            'JEN_l_'       
    'the'         'determiner'      'D_@'  
    'gengles'     'noun'            'gEN_l_z'        
    '.'           'punctuation'     '_'

% A classical example of an artificial fractal set is the Kock curve.
% the genglish gengle of the genglish gengle gengle is the John gengle.

    'the'         'determiner'      'D_@'  
    'genglish'    'adjective'       'gEN_lIS_'  
    'gengle'      'noun'            'gEN_l_'       
    'of'          'of'              'Qv'          
    'the'         'determiner'      'D_@'  
    'genglish'    'adjective'       'gEN_lIS_'  
    'gengle'      'noun'            'gEN_l_'       
    'gengle'      'noun'            'gEN_l_'       
    'is'          'auxiliary'       'Iz'   
    'the'         'determiner'      'D_@'  
    'john'        'propername'      'JQ_n'  
    'gengle'      'noun'            'gEN_l_'       
    '.'           'punctuation'     '_'

% Using this theory, image parts were not required to resemble the whole image.
% gengling the gengle, gengle gengles are gengled to gengle the genglish gengle.

    'gengling'    'participle'      'JEN_lIN_'
    'the'         'determiner'      'D_@'  
    'gengle'      'noun'            'gEN_l_'       
    ','           'punctuation'     '_'
    'gengle'      'noun'            'gEN_l_'       
    'gengles'     'noun'            'gEN_l_z'        
    'are'         'auxiliary'       'Ar_'
    'gengled'     'participle'      'JEN_l_d'
    'to'          'to'              'tU'          
    'gengle'      'verb'            'JEN_l_'       
    'the'         'determiner'      'D_@'  
    'genglish'    'adjective'       'gEN_lIS_'  
    'gengle'      'noun'            'gEN_l_'       
    '.'           'punctuation'     '_'

% I think many people are interested in psychic phenomena.
% It gengles the gengles are gengled on genglish gengles.

    'it'          'pronoun'         'It'      
    'gengles'     'verb'            'JEN_l_z' 
    'the'         'determiner'      'D_@'     
    'gengles'     'noun'            'gEN_l_z' 
    'are'         'auxiliary'       'Ar_'     
    'gengled'     'participle'      'JEN_l_d' 
    'on'          'preposition'     'Qn'      
    'genglish'    'adjective'       'gEN_lIS_'
    'gengles'     'noun'            'gEN_l_z' 
    '.'           'punctuation'     '_'       

% I write about very nice people whose lives are invaded.
% It gengles on genglish gengles which gengles are gengled.

    'it'          'pronoun'         'It'      
    'gengles'     'verb'            'JEN_l_z' 
    'on'          'preposition'     'Qn'      
    'gengly'      'adverb'          'gEN_lI'  
    'genglish'    'adjective'       'gEN_lIS_'
    'gengles'     'noun'            'gEN_l_z' 
    'which'       'pronoun'         'w_IC_'   
    'gengles'     'noun'            'gEN_l_z' 
    'are'         'auxiliary'       'Ar_'     
    'gengled'     'participle'      'JEN_l_d' 
    '.'           'punctuation'     '_'       

% It was the balancing of the psychic elements with the suspense elements.
% It is the gengle of the genglish gengles on the gengle gengles.

    'it'          'pronoun'         'It'      
    'is'          'auxiliary'       'Iz'      
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'of'          'of'              'Qv'      
    'the'         'determiner'      'D_@'     
    'genglish'    'adjective'       'gEN_lIS_'
    'gengles'     'noun'            'gEN_l_z' 
    'on'          'preposition'     'Qn'      
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'gengles'     'noun'            'gEN_l_z' 
    '.'           'punctuation'     '_'       

% I get a cup of coffee, and go to my office which is nice and quiet.
% It gengles the gengle of gengle, and gengles on the gengle which is genglish and genglish.

    'it'          'pronoun'         'It'      
    'gengles'     'verb'            'JEN_l_z' 
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'of'          'of'              'Qv'      
    'gengle'      'noun'            'gEN_l_'  
    ','           'punctuation'     '_'       
    'and'         'coordinator'     'End'     
    'gengles'     'verb'            'JEN_l_z' 
    'on'          'preposition'     'Qn'      
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'which'       'pronoun'         'w_IC_'   
    'is'          'auxiliary'       'Iz'      
    'genglish'    'adjective'       'gEN_lIS_'
    'and'         'coordinator'     'End'     
    'genglish'    'adjective'       'gEN_lIS_'
    '.'           'punctuation'     '_'       

% Her mother is a strong influence in her life.
% The gengle is the genglish gengle on the gengle.

    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'is'          'auxiliary'       'Iz'      
    'the'         'determiner'      'D_@'     
    'genglish'    'adjective'       'gEN_lIS_'
    'gengle'      'noun'            'gEN_l_'  
    'on'          'preposition'     'Qn'      
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    '.'           'punctuation'     '_'       

% He left my mother a widow, with three kids to support.
% It gengled the gengle the gengle, on the gengles to gengle.

    'it'          'pronoun'         'It'      
    'gengled'     'verb'            'JEN_l_d' 
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    ','           'punctuation'     '_'       
    'on'          'preposition'     'Qn'      
    'the'         'determiner'      'D_@'     
    'gengles'     'noun'            'gEN_l_z' 
    'to'          'to'              'tU'      
    'gengle'      'verb'            'JEN_l_'  
    '.'           'punctuation'     '_'       

% In this method, similaries between different scales of the same image are used for compression.
% On the gengle, gengles on genglish gengles of the genglish gengle are gengled on gengle.

    'on'          'preposition'     'Qn'      
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    ','           'punctuation'     '_'       
    'gengles'     'noun'            'gEN_l_z' 
    'on'          'preposition'     'Qn'      
    'genglish'    'adjective'       'gEN_lIS_'
    'gengles'     'noun'            'gEN_l_z' 
    'of'          'of'              'Qv'      
    'the'         'determiner'      'D_@'     
    'genglish'    'adjective'       'gEN_lIS_'
    'gengle'      'noun'            'gEN_l_'  
    'are'         'auxiliary'       'Ar_'     
    'gengled'     'participle'      'JEN_l_d' 
    'on'          'preposition'     'Qn'      
    'gengle'      'noun'            'gEN_l_'  
    '.'           'punctuation'     '_'       

% The method is rooted in the work of Mandelbrot, who introduced the concept of fractals and the fractal dimension.
% The gengle is gengled on the gengle of John, which gengled the gengle of gengles and the genglish gengle.

    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'is'          'auxiliary'       'Iz'      
    'gengled'     'participle'      'JEN_l_d' 
    'on'          'preposition'     'Qn'      
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'of'          'of'              'Qv'      
    'john'        'propername'      'JQ_n'    
    ','           'punctuation'     '_'       
    'which'       'pronoun'         'w_IC_'   
    'gengled'     'verb'            'JEN_l_d' 
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'of'          'of'              'Qv'      
    'gengles'     'noun'            'gEN_l_z' 
    'and'         'coordinator'     'End'     
    'the'         'determiner'      'D_@'     
    'genglish'    'adjective'       'gEN_lIS_'
    'gengle'      'noun'            'gEN_l_'  
    '.'           'punctuation'     '_'       

% This section gives a brief review of the concept of fractals and its applications especially in image compression.
% The gengle gengles the genglish gengle of the gengle of gengles and the gengles gengly on gengle gengles.

    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'gengles'     'verb'            'JEN_l_z' 
    'the'         'determiner'      'D_@'     
    'genglish'    'adjective'       'gEN_lIS_'
    'gengle'      'noun'            'gEN_l_'  
    'of'          'of'              'Qv'      
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'and'         'coordinator'     'End'     
    'the'         'determiner'      'D_@'     
    'gengles'     'noun'            'gEN_l_z' 
    'gengly'      'adverb'          'gEN_lI'  
    'on'          'preposition'     'Qn'      
    'gengle'      'noun'            'gEN_l_'  
    'gengles'     'noun'            'gEN_l_z' 
    '.'           'punctuation'     '_'       

% It shows differents steps in the construction of Koch curves.
% It gengles genglish gengles on the gengle of John gengles.

    'it'          'pronoun'         'It'      
    'gengles'     'verb'            'JEN_l_z' 
    'genglish'    'adjective'       'gEN_lIS_'
    'gengles'     'noun'            'gEN_l_z' 
    'on'          'preposition'     'Qn'      
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'of'          'of'              'Qv'      
    'john'        'propername'      'JQ_n'    
    'gengles'     'noun'            'gEN_l_z' 
    '.'           'punctuation'     '_'       

% Since the introduction of the concept of fractals by Mandelbrot, the concept has been used in many different branche including mathematics,physics and chemistry.
% Since the gengle of the gengle of gengles on John, the gengle is gengled on genglish gengles gengling gengle, gengle, and gengle.

    'since'       'subordinator'    'sIns_'   
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'of'          'of'              'Qv'      
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'of'          'of'              'Qv'      
    'gengles'     'noun'            'gEN_l_z' 
    'on'          'preposition'     'Qn'      
    'john'        'propername'      'JQ_n'    
    ','           'punctuation'     '_'       
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'is'          'auxiliary'       'Iz'      
    'gengled'     'participle'      'JEN_l_d' 
    'on'          'preposition'     'Qn'      
    'genglish'    'adjective'       'gEN_lIS_'
    'gengles'     'noun'            'gEN_l_z' 
    'gengling'    'participle'      'JEN_lIN_'
    'gengle'      'noun'            'gEN_l_'  
    ','           'punctuation'     '_'       
    'gengle'      'noun'            'gEN_l_'  
    ','           'punctuation'     '_'       
    'and'         'coordinator'     'End'     
    'gengle'      'noun'            'gEN_l_'  
    '.'           'punctuation'     '_'       

% These transformations, which Barnsley later named IFS, were originally used for generating fractals.
% The gengles, which John gengly gengled John, are gengly gengled on gengling gengles.

    'the'         'determiner'      'D_@'     
    'gengles'     'noun'            'gEN_l_z' 
    ','           'punctuation'     '_'       
    'which'       'pronoun'         'w_IC_'   
    'john'        'propername'      'JQ_n'    
    'gengly'      'adverb'          'gEN_lI'  
    'gengled'     'verb'            'JEN_l_d' 
    'john'        'propername'      'JQ_n'    
    ','           'punctuation'     '_'       
    'are'         'auxiliary'       'Ar_'     
    'gengly'      'adverb'          'gEN_lI'  
    'gengled'     'participle'      'JEN_l_d' 
    'on'          'preposition'     'Qn'      
    'gengling'    'participle'      'JEN_lIN_'
    'gengles'     'noun'            'gEN_l_z' 
    '.'           'punctuation'     '_'       

% IFS transformations describe the relationship between the whole image and its parts.
% John gengles gengle the gengle on the genglish gengle and the gengles.

    'john'        'propername'      'JQ_n'    
    'gengles'     'noun'            'gEN_l_z' 
    'gengle'      'verb'            'JEN_l_'  
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'on'          'preposition'     'Qn'      
    'the'         'determiner'      'D_@'     
    'genglish'    'adjective'       'gEN_lIS_'
    'gengle'      'noun'            'gEN_l_'  
    'and'         'coordinator'     'End'     
    'the'         'determiner'      'D_@'     
    'gengles'     'noun'            'gEN_l_z' 
    '.'           'punctuation'     '_'       

% The work by Jacquin provided a platform for others to continue this line of research.
% The gengle on John gengled the gengle on it to gengle the gengle of gengle.

    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'on'          'preposition'     'Qn'      
    'john'        'propername'      'JQ_n'    
    'gengled'     'verb'            'JEN_l_d' 
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'on'          'preposition'     'Qn'      
    'it'          'pronoun'         'It'      
    'to'          'to'              'tU'      
    'gengle'      'verb'            'JEN_l_'  
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'of'          'of'              'Qv'      
    'gengle'      'noun'            'gEN_l_'  
    '.'           'punctuation'     '_'       

% For the most natural images, it is not possible to closely approximate all parts of the image by a small number of transformations applied on the whole image.
% On the genglish gengles, it is genglish to gengly gengle the gengles of the gengle on the genglish gengle of gengles gengled on the genglish gengle.

    'on'          'preposition'     'Qn'      
    'the'         'determiner'      'D_@'     
    'genglish'    'adjective'       'gEN_lIS_'
    'gengles'     'noun'            'gEN_l_z' 
    ','           'punctuation'     '_'       
    'it'          'pronoun'         'It'      
    'is'          'auxiliary'       'Iz'      
    'genglish'    'adjective'       'gEN_lIS_'
    'to'          'to'              'tU'      
    'gengly'      'adverb'          'gEN_lI'  
    'gengle'      'verb'            'JEN_l_'  
    'the'         'determiner'      'D_@'     
    'gengles'     'noun'            'gEN_l_z' 
    'of'          'of'              'Qv'      
    'the'         'determiner'      'D_@'     
    'gengle'      'noun'            'gEN_l_'  
    'on'          'preposition'     'Qn'      
    'the'         'determiner'      'D_@'     
    'genglish'    'adjective'       'gEN_lIS_'
    'gengle'      'noun'            'gEN_l_'  
    'of'          'of'              'Qv'      
    'gengles'     'noun'            'gEN_l_z' 
    'gengled'     'participle'      'JEN_l_d' 
    'on'          'preposition'     'Qn'      
    'the'         'determiner'      'D_@'     
    'genglish'    'adjective'       'gEN_lIS_'
    'gengle'      'noun'            'gEN_l_'  
    '.'           'punctuation'     '_'       

};

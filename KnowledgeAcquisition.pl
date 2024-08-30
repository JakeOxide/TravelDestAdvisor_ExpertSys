% Travel Destination Advisor System 
% This file contains The Knowledge Acquisition Module



% Save the new destination fact at the end of the file
saveKnowledgeBase(Filename, City, Weather, Feature) :-
    open(Filename, append, Stream),  % Open in append mode
    format(Stream, 'destination(~w, ~w, ~w).~n', [City, Weather, Feature]),  % Write the new destination fact
    close(Stream).

% Save the new feature fact at the end of the file
saveKnowledgeBaseF(Filename, Feature) :-
    open(Filename, append, Stream),  % Open in append mode
    format(Stream, 'prefers(~w).~n', [Feature]),  % Write the new feature fact
    close(Stream).

% Save the new weather fact at the end of the file
saveKnowledgeBaseW(Filename, Weather) :-
    open(Filename, append, Stream),  % Open in append mode
    format(Stream, 'wants(~w).~n', [Weather]),  % Write the new weather fact
    close(Stream).

% Learn is a predicate called by the GUI to add facts to all the KBs respectively
% First in memory using assert predicate
% assert() is a built-in predicate that adds new facts to our KB (in memory)
% Then into the respective KB files to persistently save learnt knowledge
learn(City, Weather, Feature) :-

    Dkb = '.\\KnowledgeBases\\destinationknowledgebase.pl',
    Fkb = '.\\KnowledgeBases\\featureknowledgebase.pl',
    Wkb = '.\\KnowledgeBases\\weatherknowledgebase.pl',

    % Add new destination to our Destination KB (in memory)
    assert(destination(City, Weather, Feature)),

    % Write the new fact to the Destination KB file
    saveKnowledgeBase(Dkb, City, Weather, Feature),

    % Add new feature to our Feature KB (in memory)
    assert(prefers(Feature)),
    
    % Write the new fact to the Feature KB file
    saveKnowledgeBaseF(Fkb, Feature),

    % Add new Weather to our Weather KB (in memory)
    assert(wants(Weather)),

    % Write the new fact to the Weather KB file
    saveKnowledgeBaseW(Wkb, Weather).
    





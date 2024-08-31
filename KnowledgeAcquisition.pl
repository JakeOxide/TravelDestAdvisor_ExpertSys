% Travel Destination Advisor System 
% This file contains The Knowledge Acquisition Module

:- consult('D:\\SPR2024\\AI\\Assignments\\Assignment III\\PrologTests\\Test v1.0\\TravelDestAdvisor_ExpertSys\\KnowledgeBases\\DestinationKnowledgeBase.pl').
:- consult('D:\\SPR2024\\AI\\Assignments\\Assignment III\\PrologTests\\Test v1.0\\TravelDestAdvisor_ExpertSys\\KnowledgeBases\\featureknowledgebase.pl').
:- consult('D:\\SPR2024\\AI\\Assignments\\Assignment III\\PrologTests\\Test v1.0\\TravelDestAdvisor_ExpertSys\\KnowledgeBases\\weatherknowledgebase.pl').


% Replace spaces with underscores and convert to lowercase
format_and_modify_string(String, ModifiedString) :-
    downcase_atom(String, LowercaseString),
    atomic_list_concat(Atoms, ' ', LowercaseString),
    atomic_list_concat(Atoms, '_', ModifiedString).

% Save the new destination fact if it doesn't exist
saveKnowledgeBase(Filename, City, Weather, Feature) :-
    format_and_modify_string(City, CityUnderscored),
    format_and_modify_string(Weather, WeatherUnderscored),
    format_and_modify_string(Feature, FeatureUnderscored),

    % Check if the destination already exists
    (   destination(CityUnderscored, WeatherUnderscored, FeatureUnderscored) ->
        format('Destination ~w already exists.~n', [CityUnderscored])
    ;   open(Filename, append, Stream),  
        format(Stream, 'destination(~w, ~w, ~w).~n', 
               [CityUnderscored, WeatherUnderscored, FeatureUnderscored]),  
        close(Stream)
    ).

% Save the new feature fact if it doesn't exist
saveKnowledgeBaseF(Filename, Feature) :-
    format_and_modify_string(Feature, FeatureUnderscored),
    
    % Check if the feature already exists
    (   prefers(FeatureUnderscored) ->
        format('Feature ~w already exists.~n', [FeatureUnderscored])
    ;   open(Filename, append, Stream),  
        format(Stream, 'prefers(~w).~n', [FeatureUnderscored]),  
        close(Stream)
    ).

% Save the new weather fact if it doesn't exist
saveKnowledgeBaseW(Filename, Weather) :-
    format_and_modify_string(Weather, WeatherUnderscored),
    
    % Check if the weather already exists
    (   wants(WeatherUnderscored) ->
        format('Weather ~w already exists.~n', [WeatherUnderscored])
    ;   open(Filename, append, Stream),  
        format(Stream, 'wants(~w).~n', [WeatherUnderscored]),  
        close(Stream)
    ).

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
    





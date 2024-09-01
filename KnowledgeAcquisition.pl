% Travel Destination Advisor System 
% This file contains The Knowledge Acquisition Module

:- module(knowledge_acquisition, [
    format_and_modify_string/2,
    saveKnowledgeBase/4,
    saveKnowledgeBaseF/2,
    saveKnowledgeBaseW/2,
    learn/3
]).

% Importing Knowledge Base files
:- consult('D:\\SPR2024\\AI\\Assignments\\Assignment III\\PrologTests\\Test v1.0\\TravelDestAdvisor_ExpertSys\\KnowledgeBases\\DestinationKnowledgeBase.pl').
:- consult('D:\\SPR2024\\AI\\Assignments\\Assignment III\\PrologTests\\Test v1.0\\TravelDestAdvisor_ExpertSys\\KnowledgeBases\\featureknowledgebase.pl').
:- consult('D:\\SPR2024\\AI\\Assignments\\Assignment III\\PrologTests\\Test v1.0\\TravelDestAdvisor_ExpertSys\\KnowledgeBases\\weatherknowledgebase.pl').

% Replace spaces with underscores and convert to lowercase
format_and_modify_string(String, ModifiedString) :-
    downcase_atom(String, LowercaseString),
    atomic_list_concat(Atoms, ' ', LowercaseString),
    atomic_list_concat(Atoms, '_', ModifiedString).

% Save the new destination fact
saveKnowledgeBase(Filename, City, Weather, Feature) :-
    format_and_modify_string(City, CityUnderscored),
    format_and_modify_string(Weather, WeatherUnderscored),
    format_and_modify_string(Feature, FeatureUnderscored),

    open(Filename, append, Stream),
    format(Stream, 'destination(~w, ~w, ~w).~n', 
           [CityUnderscored, WeatherUnderscored, FeatureUnderscored]),
    close(Stream).

% Save the new feature fact
saveKnowledgeBaseF(Filename, Feature) :-
    format_and_modify_string(Feature, FeatureUnderscored),
    
    open(Filename, append, Stream),
    format(Stream, 'prefers(~w).~n', [FeatureUnderscored]),
    close(Stream).

% Save the new weather fact
saveKnowledgeBaseW(Filename, Weather) :-
    format_and_modify_string(Weather, WeatherUnderscored),
    
    open(Filename, append, Stream),
    format(Stream, 'wants(~w).~n', [WeatherUnderscored]),
    close(Stream).

% Learn is a predicate called by the GUI to add facts to all the KBs respectively
learn(City, Weather, Feature) :-
    Dkb = '.\\KnowledgeBases\\destinationknowledgebase.pl',
    Fkb = '.\\KnowledgeBases\\featureknowledgebase.pl',
    Wkb = '.\\KnowledgeBases\\weatherknowledgebase.pl',

    % Normalize inputs
    normalize_input(Weather, NormalizedWeather),
    normalize_input(Feature, NormalizedFeature),

    % Check if the weather already exists
    (   wants(NormalizedWeather) ->
        format('Weather ~w already exists. ~n', [NormalizedWeather])
    ;   assert(wants(NormalizedWeather)),
        saveKnowledgeBaseW(Wkb, NormalizedWeather)
    ),

    % Check if the feature already exists
    (   prefers(NormalizedFeature) ->
        format('Feature ~w already exists. ~n', [NormalizedFeature])
    ;   assert(prefers(NormalizedFeature)),
        saveKnowledgeBaseF(Fkb, NormalizedFeature)
    ),

    % Allow any destination to be added
    assert(destination(City, NormalizedWeather, NormalizedFeature)),
    saveKnowledgeBase(Dkb, City, NormalizedWeather, NormalizedFeature).

% Normalize input by converting to lowercase
normalize_input(Input, Normalized) :-
    downcase_atom(Input, Normalized).
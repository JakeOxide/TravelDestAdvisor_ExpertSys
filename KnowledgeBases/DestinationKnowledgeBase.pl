% Travel Destination Advisor System 
% This file contains The Destination Knowledge Base
% Facts include - Destinations
% Rules include - Destinations


% Importing Feature KB to access its Facts and Rules
:- ['.\\KnowledgeBases\\featureknowledgebase.pl'].

% Importing Weather KB to access its Facts and Rules
:- ['.\\KnowledgeBases\\weatherknowledgebase.pl'].


% Rules

% Destination Rules - recommendation(city, weather, feature) :-

    recommendation(City, Weather, Feature) :-
        destination(City, Weather, Feature);
        prefers(Feature),
        wants(Weather).
    
    
% Destination Facts - destination()

% This dynamic fact initialization is required to dynamically add or manipulate facts 
% in our case it is required to perform - assert() - from the Knowledge Acquisition Module)

:- dynamic destination/3. % destination/3 => 3 indicates the number or args the fact definition accepts

destination(france, average, museums).
destination(india, hot, culture).
destination(russia, cold, adventure).
destination(canada, cold, adventure).
destination(brazil, warm, beach).
destination(australia, warm, surfing).
destination(antarctica, cold, exploration).
destination(japan, temperate, cultural).
destination(egypt, hot, historical).
destination(new_zealand, mild, hiking).
destination(ukraine, cold, winter_sports).
destination(thailand, tropical, relaxation).
destination(scotland, cool, heritage).



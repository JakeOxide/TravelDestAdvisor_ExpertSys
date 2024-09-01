% Travel Destination Advisor System 
% This file contains The Destination Knowledge Base
% Facts include - Destinations
% Rules include - Destinations


% Importing Feature KB to access its Facts and Rules
:- consult('D:\\SPR2024\\AI\\Assignments\\Assignment III\\PrologTests\\Test v1.0\\TravelDestAdvisor_ExpertSys\\KnowledgeBases\\featureknowledgebase.pl').
:- consult('D:\\SPR2024\\AI\\Assignments\\Assignment III\\PrologTests\\Test v1.0\\TravelDestAdvisor_ExpertSys\\KnowledgeBases\\weatherknowledgebase.pl').


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

destination(paris, average, museums).
destination(mumbai, hot, culture).
destination(st_petersburg, cold, adventure).
destination(rio, warm, beach).
destination(sydney, warm, surfing).
destination(antarctica, cold, exploration).
destination(tokyo, temperate, cultural).
destination(cairo, hot, historical).
destination(auckland, mild, hiking).
destination(kyiv, cold, winter_sports).
destination(bangkok, tropical, relaxation).
destination(edinburgh, cool, heritage).
destination(tokyo, hot, cultural_attractions).
destination(barcelona, warm, architecture).
destination(istanbul, mild, historical_sites).
destination(kyoto, mild, temples).
destination(hanoi, extreme, street_food).
destination(hanoi, extreme, streetfood).
destination(hanoi, extreme, streetfood).
destination(hanoi, extreme, streetfood).
destination(rome, moderate, historicsites).
destination(lossantos, unknown, statues).
destination(lasvegas, humid, casinos).
destination(lasvegas, humid, casinos).
destination(hanoi, extreme, street_food).
destination(venice, warm, canals).
destination(moscow, cold, adventure).
destination(bangkok, high, towers).
destination(hongkong, humid, technology).
destination(berlin, moderatelycold, wall).
destination(lisbon, sunny, nightlife).

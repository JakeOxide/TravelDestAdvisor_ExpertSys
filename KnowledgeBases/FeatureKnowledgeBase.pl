% Travel Destination Advisor System 
% This file contains The Features Knowledge Base
% Facts include - Features
% Rules include - Features 


% Feature Rule (test)

isPrefered(Feature) :-
    prefers(Feature).


% Feature Facts - prefers()

% This dynamic fact initialization is required to dynamically add or manipulate facts 
% in our case it is required to perform - assert() - from the Knowledge Acquisition Module)

:- dynamic prefers/1. % prefers/1 => 1 indicates the number or args the fact definition accepts

prefers(museums).
prefers(culture).
prefers(adventure).
prefers(beaches).
prefers(relaxation).
prefers(cultural).
prefers(surfing).
prefers(hiking).
prefers(winter_sports).
prefers(history).
prefers(beach).
prefers(exploration).
prefers(heritage).
prefers(cultural_attractions).
prefers(architecture).
prefers(historical_sites).
prefers(temples).

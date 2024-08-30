% Travel Destination Advisor System
% This file contains The Inference Engine

% Importing the Destination KB, which also has the Features and Weather KBs
:- ['.\\KnowledgeBases\\destinationknowledgebase.pl'].

% Main Predicate that interacts with the GUI module and calls the Destination KB to find solutions.
suggestDestination(City, Weather, Feature) :-

    % Call to the recommendation predicate in the Destination KB
    recommendation(City, Weather, Feature),

    % Output the result in a formatted string - You might want to visit : ~w~n', 
    % Where: ~w is a placeholder for a term, ~n is a new line escape char
    format('You might want to visit : ~w~n', [City]).
    

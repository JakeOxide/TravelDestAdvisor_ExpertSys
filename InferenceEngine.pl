% Travel Destination Advisor System
% This file contains The Inference Engine

:- use_module(library(http/http_json)).
:- use_module(library(http/http_parameters)).

% Importing the Destination KB
:- consult('D:\\SPR2024\\AI\\Assignments\\Assignment III\\PrologTests\\Test v1.0\\TravelDestAdvisor_ExpertSys\\KnowledgeBases\\DestinationKnowledgeBase.pl').

% Main Predicate that interacts with the GUI module
suggestDestination(City, Weather, Feature) :-
    recommendation(City, Weather, Feature),
    !. % Cut here ensures no further backtracking once a valid city is found.
% Travel Destination Advisor System
% This file contains The Inference Engine

:- module(inference_engine, [suggestDestination/3, get_explanation/4]).

:- use_module(library(http/http_json)).
:- use_module(library(http/http_parameters)).
:- use_module(explanation_module).

% Importing the Destination KB
:- consult('D:\\SPR2024\\AI\\Assignments\\Assignment III\\PrologTests\\Test v1.0\\TravelDestAdvisor_ExpertSys\\KnowledgeBases\\DestinationKnowledgeBase.pl').
:- consult('D:\\SPR2024\\AI\\Assignments\\Assignment III\\PrologTests\\Test v1.0\\TravelDestAdvisor_ExpertSys\\ExplanationModule.pl').

% Main Predicate that interacts with the GUI module
suggestDestination(City, Weather, Feature) :-
    recommendation(City, Weather, Feature),
    !. % Cut here ensures no further backtracking once a valid city is found.
% Example Prolog predicate
suggest_cities(Weather, Feature, Cities) :-
    findall(City, destination(City, Weather, Feature), CitiesList),
    maplist(downcase_atom, CitiesList, Cities). % Ensure cities are in the correct format

get_explanation(City, Weather, Feature, Reason) :-
    explanation(City, Weather, Feature, Reason).

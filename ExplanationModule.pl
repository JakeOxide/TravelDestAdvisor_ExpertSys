%:- module(explanation_module, [explanation/4, get_explanation/4]).

:- module(explanation_module, [explanation/4, get_explanation/4]).

:- consult('D:\\SPR2024\\AI\\Assignments\\Assignment III\\PrologTests\\Test v1.0\\TravelDestAdvisor_ExpertSys\\KnowledgeBases\\DestinationKnowledgeBase.pl').

explanation(City, Weather, Feature, Reason) :-
    Reason = "We recommend " + City + " for its " + Feature + " and " + Weather + " weather.".

get_explanation(City, Weather, Feature, Reason) :-
    explanation(City, Weather, Feature, Reason).

% ExplanationModule.pl

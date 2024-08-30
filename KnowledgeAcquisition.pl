% Travel Destination Advisor System 
% This file contains The Knowledge Acquisition Module


% Learn is a predicate called by the GUI to add facts to all the KBs respectively
% assert() is a built-in predicate that adds new facts to our KB
learn(City, Weather, Feature) :-

    % Add new destination to our Destination KB
    assert(destination(City, Weather, Feature)),

    % Add new feature to our Feature KB
    assert(prefers(Feature)),

    % Add new Weather to our Weather KB
    assert(wants(Weather)).
    





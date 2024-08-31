% Travel Destination Advisor System
% This file contains The Weather Knowledge Base
% Facts include - Weather Facts
% Rules include - Weather Rules


% Weather Rule (test)

isWanted(Weather) :-
    wants(Weather).


% Weather Facts - wants()

% This dynamic fact initialization is required to dynamically add or manipulate facts 
% in our case it is required to perform - assert() - from the Knowledge Acquisition Module)

:- dynamic wants/1. % wants/1 => 1 indicates the number or args the fact definition accepts

wants(extreme).
wants(average).
wants(cold).
wants(hot).
wants(mild).
wants(tropical).
wants(temperate).
wants(cool).
wants(freezing).
wants(sunny).
wants(dry).
wants(humid).
wants(hot).
wants(warm).
wants(mild).
wants(mild).

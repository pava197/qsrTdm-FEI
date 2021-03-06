/*****************************************************************
 * This file is part of the masterTDM projet based on the paper
 * M. Soutchanski and  P.Santos
 * "Reasoning about Dynamic Depth Profiles"
 * 
 * mail: caiopava@fei.edu.br
 * author: Caio Pavanelli Truffe de Oliveira
 * Copyright (C): 2016, Electrical Engineering Department, Centro Universit�rio da FEI
 *
 *****************************************************************/
 
 :- module(facing,[
		facing/3
	]).		
	
:- dynamic facing/3.

facing(Theta2, loc(Xr, Yr), do(Action, Situation)):-
	Action=endPan(Omega, _),
	facing(Theta1, loc(Xr, Yr), Situation),
	Theta2 is Theta1 + Omega, !.

%% location parameters were removed because the main value is Theta, and it's not related to the location
%% the robot is in the given situation
facing(Theta2, loc(_, _), do(Action, Situation)):-
	facing(Theta2, loc(_, _), Situation),
	not(Action=endPan(_, _)), !.
	

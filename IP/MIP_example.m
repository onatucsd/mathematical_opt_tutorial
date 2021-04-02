clc;
clear;
close all;

%%% Mixed Integer Programming (MIP) Example - Diet Problem

%%% Define decision variables
x1 = intvar(1); % number of apples to be consumed
x2 = intvar(1); % number of oranges to be consumed
x3 = sdpvar(1); % gallons of milk to be consumed

%%% Define constraints
Constraints = [];
Constraints = [Constraints, 70*x1 + 90*x2 + 400*x3 >= 500]; % calorie
Constraints = [Constraints, 0.5*x1 + 0.2*x2 + 4*x3 >= 6]; % protein
Constraints = [Constraints, 2*x1 + 3*x2 + 2.5*x3 >= 10]; % sugar
Constraints = [Constraints, x1 - 0.5*x2 >= 0.1]; % amount 
Constraints = [Constraints, x1 >= 0, x2 >= 0, x3 >= 0]; % non-negativity

%%% Define objective function
Objective = 1.5*x1 + 2*x2 + 3*x3; % miminize total cost

%%% Solve the problem
sol = optimize(Constraints, Objective);

if sol.problem == 0
    % Extract and display value
    solution_apples = value(x1)
    solution_oranges = value(x2)
    solution_milk = value(x3)
    objective_value = value(Objective)
else
    display('Hmm, something went wrong!');
    sol.info
    yalmiperror(sol.problem)
end


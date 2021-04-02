clc;
clear;
close all;

%%% Binary Integer Programming (BIP) Example - Investment

%%% Define variables
x1 = binvar(1); % Shirley's Sandwiches investment decision
x2 = binvar(1); % Greendale Community College investment decision
x3 = binvar(1); % Señor Chang’s security school investment decision 
x4 = binvar(1); % Abed’s new movie investment decision      

%%% Define constraints
Constraints = [];
Constraints = [Constraints, 9*x1 + 7*x2 + 7*x3 + 3*x4 <= 24]; % total heritage
Constraints = [Constraints, x1 + x2 + x3 + x4 == 2]; % total number of investment 
Constraints = [Constraints, x2 - x4 <= 0]; % 1st dependency constraint
Constraints = [Constraints, x1 + x3 <= 1]; % 2nd dependency constraint

%%% Define objective
Objective = -(13*x1 + 11*x2 + 10*x3 + 5*x4); % maximize total present value

%%% Solve the problem
sol = optimize(Constraints, Objective);

if sol.problem == 0
    % Extract and display value
    solution_shirley = value(x1)
    solution_greendale = value(x2)
    solution_chang = value(x3)
    solution_abed = value(x4)
    objective_value = value(-Objective)
else
    display('Hmm, something went wrong!');
    sol.info
    yalmiperror(sol.problem)
end


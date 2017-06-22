function [Pcrosscovariance] = Pcrosscovariance_withWeights(SigmaPointsBefore, SigmaPointsNow, Weights)
%% Descriptions
%Function that computes the cross covariance matrix

%Author: Victor Araujo Vieira.
%e-mail: icevct@gmail.com
%University of Brasilia - Brazil.

%Inputs
%SigmaPointsBefore: Sigma points before that is generated by the sigma
%representation function

%SigmaPointsNow: Sigma points after evaluating the sigma points before in
%the state of measurement function

%Weights: The weight vector that was computed by the sigma representation
%function

%Outputs
%Pcrosscovariance: The cross covariance matrix

%% Implementation

N = size(SigmaPointsNow, 2); % amount of sigma points

n = size(SigmaPointsBefore, 1); % amount of states
y = size(SigmaPointsNow, 1); % amount of measurements

StatePredicted = SigmaPointsBefore*Weights;
MeasurementPredicted = SigmaPointsNow*Weights;

Pcrosscovariance = zeros(n, y); 
for i = 1:N
    Pcrosscovariance = Pcrosscovariance + Weights(i, 1)*(SigmaPointsBefore(:, i) - StatePredicted)*(SigmaPointsNow(:, i) - MeasurementPredicted)';
end

end

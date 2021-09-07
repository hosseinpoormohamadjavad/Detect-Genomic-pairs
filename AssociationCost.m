function [z] = AssociationCost(m, X,FragmentNum,FragmentSize)
% m is an indivisual of Population.
% X is HiC Dataset.
% FragmentNum is number of fragment.

Fitness=zeros(1);
  
Fitness(1)=CostChr(X,m.SrcChr,m.DistChr,m.R_Src,m.R_Dist,FragmentNum,FragmentSize);
  
% Calculate Summation of Cluster's Fitness
FitnessTotal=Fitness(1);
z=FitnessTotal;
end   
function [ Data ] = Preprocessing( X,Chr )
% X is Hic's Interaction Data.
% Chr is information of Choromosom.
SizeX=size(X,1);
Counter=zeros(1);
Counter=1;
% disp('Starting Preprocessing of Data HiC interaction.');
% disp('Steps:');
for i=1:SizeX
%    disp(i);
   left=X(i,1);
   right=X(i,2);
   [IdL,~]=find(Chr(:,4)==left);
   [IdR,~]=find(Chr(:,4)==right);
   if Chr(IdL,1)~=Chr(IdR,1)
      D(Counter)=i;
      Counter=Counter+1;
   end
end
% disp(D);
X(D,:)=[];
Data=X;
end


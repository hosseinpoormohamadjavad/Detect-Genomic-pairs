function [ Result ] = Show_Result( X,R )

Sz=size(R,1);
RR=zeros(Sz,10);
for i=1:Sz
[IdxSs,~]=find(X(:,4)==R(i,1));
RR(i,1)=X(IdxSs,1);
RR(i,2)=X(IdxSs,2);
[IdxDs,~]=find(X(:,4)==R(i,2));
RR(i,3)=X(IdxDs,3);
RR(i,4)=R(i,3);

[IdxSd,~]=find(X(:,4)==R(i,5));
disp(IdxSd);
RR(i,6)=X(IdxSd,1);
RR(i,7)=X(IdxSd,2);
[IdxDs,~]=find(X(:,4)==R(i,6));
RR(i,8)=X(IdxDs,3);
RR(i,9)=R(i,7);
RR(i,10)=R(i,8);

end
Result=RR;

end


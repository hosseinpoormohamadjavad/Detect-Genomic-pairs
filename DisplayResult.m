function [Itract]=DisplayResult(X,Idx,FragmentNum,FragmentSize)

Count=size(Idx,1);
Counter=1;

IntractDt=zeros(Count,8);
for i=1:Count
    
    [~,P]=CostChr(X,Idx(i,1),Idx(i,2),Idx(i,3),Idx(i,4),FragmentNum,FragmentSize);
    if (P.ratio>0)
    SrcStart=Idx(i,1);
    SrcEnd=Idx(i,1)+Idx(i,3)-1;
    DistStart=Idx(i,2);
    DistEnd=Idx(i,2)+Idx(i,4)-1;
    IntractDt(Counter,1)=SrcStart;
    IntractDt(Counter,2)=SrcEnd;
    IntractDt(Counter,3)=P.Rsrc;
    IntractDt(Counter,4)=DistStart;
    IntractDt(Counter,5)=DistEnd;
    IntractDt(Counter,6)=ReadDist(DistStart,DistEnd,X);
    IntractDt(Counter,7)=P.ItractDist;
    IntractDt(Counter,8)=P.ratio;
    Counter=Counter+1;
    end
end
[iDelete,~]=find(IntractDt(:,1)==0);
IntractDt(iDelete,:)=[];
Itract=IntractDt;
end


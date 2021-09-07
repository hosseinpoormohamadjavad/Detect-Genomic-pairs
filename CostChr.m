function [ cost,Out ] = CostChr( X,s,d,rs,rd,FragmentNum,FragmentSize )

count1=1;
count2=1;
Flag=1;
ReadSrc=zeros(1,FragmentNum);
ItracDist=zeros(1,FragmentNum);
Itrac=zeros(1,FragmentNum);
ratio=0;

LeftS=s;
LeftE=s+rs-1;

RightS=d;
RightE=d+rd-1;
        IX1=find(X(:,1)==LeftS & X(:,2)==RightS,1);
        IX2=find(X(:,1)==LeftS & X(:,2)==RightE,1);
        IX3=find(X(:,1)==LeftE & X(:,2)==RightS,1);
        IX4=find(X(:,1)==LeftE & X(:,2)==RightE,1);
        
        if (isempty(IX1) || isempty(IX2)|| isempty(IX3) || isempty(IX4))
        Flag=0;
        else
         
            for i=s:(s+rs-1)
                for j=d:(d+rd-1)
                   IX=find(X(:,1)==i & X(:,2)==j);
            if (isempty(IX))
            Fl=0;
            else
            ReadSrc(count2)=X(IX,4);
            ItracDist(count1)=X(IX,3);
            Itrac(count1)=(X(IX,3)/X(IX,4))/(2*FragmentSize);
            count1=count1+1;
            end
                end

           count2=count2+1;
           end
            
        end
if (Flag==1)
   ratio=((sum(ItracDist))/(sum(ReadSrc)))/((rs+rd)*FragmentSize);
end
   if ((ratio>0) &&(all(Itrac<=ratio)))
       cost=ratio;
   else
       cost=0;
   end
   
   Out.ItractDist= sum(ItracDist);
   Out.Rsrc=sum(ReadSrc);
   Out.ratio=cost;
    

end


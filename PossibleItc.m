function [IX] = PossibleItc( X,D,FragmentNum,FragmentSize )

SizeD=size(D,1);

Ipe=zeros(FragmentNum,4);
Flag=1;
Count=1;
for i=1:SizeD
   
    for j=D(i,1):D(i,2)
        
       [IFind,~]=find(X(:,1)==j);
       Ratio=D(i,8);
        
       for k=1:size(IFind,1)
            
       PrmIndex=IFind(k);
       Promoter=X(PrmIndex,1);
       Enhancer=X(PrmIndex,2);
       
       if (Enhancer>=D(i,4)) && (Enhancer<=D(i,5))
           Enhancer=0;
       end
       PrmSeq=1;
       EnhSeq=1;
       if (Enhancer==0)
           Ratio_New=0;
       else
       Ratio_New=CostChr(X,Promoter,Enhancer,PrmSeq,EnhSeq,FragmentNum,FragmentSize);
       end
       if (Ratio_New>=Ratio)
        Ipe(Count,1)=Promoter;
        Ipe(Count,2)=Enhancer;
        Ipe(Count,3)=PrmSeq;
        Ipe(Count,4)=EnhSeq;
        Count=Count+1;
                  
       end
           
       end
    end
end

Iy=Ipe;
Iyy=Ipe;
Count=Count-1;
IpeCount=Count;
for L=1:IpeCount
   Prm=Iy(L,1);
   Enh=Iy(L,2);

   Ratio=CostChr(X,Prm,Enh,PrmSeq,EnhSeq,FragmentNum,FragmentSize);
   EnhS=0;

    for Seq=0:9
       Enhc=Enh+Seq;
                   

       [IpEE,~]=find(Ipe(:,1)==Prm & Ipe(:,2)==Enhc);
       if (isempty(IpEE))
           Flag=0;
       else
           EnhS=Seq+1;

       end
    end
    if (EnhS~=0)
       Ratio_New=CostChr(X,Ipe(L,1),Ipe(L,2),PrmSeq,EnhS,FragmentNum,FragmentSize);
      
       if (Ratio_New>Ratio)
        Ipe(Count,1)=Prm;
        Ipe(Count,2)=Enh;
        Ipe(Count,3)=PrmSeq;
        Ipe(Count,4)=EnhS;
        
        Count=Count+1;
         for L2=0:EnhS
            
          [Lx,~]=find(Ipe(:,1)==Prm & Ipe(:,2)==Enh+EnhS & Ipe(:,4)==1);
          Ipe(Lx,:)=[];
        end
       end
       
    end
   
end


[ixxx,~]=find(Ipe(:,1)==Ipe(:,2) & Ipe(:,4)==1);
Ipe(ixxx,:)=[];
IX=Ipe;
end


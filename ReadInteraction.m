function [ Data ] = ReadInteraction( DataHiC,Fragment )
%DataHic is dataset of HiC.
%Fragment is number of fragment of Choromosom.
for i=1:Fragment
   j=find(DataHiC(:,1)==i);
    S=sum(DataHiC(j,3));
    DataHiC(j,4)=S;
end
 Data=DataHiC;
end


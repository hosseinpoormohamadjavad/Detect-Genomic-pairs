function [IDX]=SAOptimum10K(X,FragmentNum,FragmentSize,Chr,SeqNum,Iteration)
% X is the Hi-C dataset.
% FragmentNum is number of fragment.
% FragmentSize is size of fragment.
%Chr is details of Chromosome.
% SeqNum is maximum number of sequens in intraction.
% Itration is number of itration.
% tic;
% parpool(4);
tic;
CostFunction=@(m) AssociationCost(m, X,FragmentNum,FragmentSize);     % Cost Function

Count=1;
IDXX=zeros(100*Iteration,4);
Emty=zeros(1);
%% SA Parameters
SARUN=1;
Left=unique(X(:,1));
Right=unique(X(:,2));
while(SARUN<=Iteration)
% for SARUN= 1:Iteration
% disp(['Starting Algorithm run Iteration ',num2str(SARUN)]);
MaxIt=10;      % Maximum Number of Iterations
disp(SARUN);
MaxSubIt=5;    % Maximum Number of Sub-iterations

T0=5;          % Initial Temp.

alpha=0.99;     % Temp. Reduction Rate

% nPop=25;         % Population Size
nPop=20;
nMove=5;        % Number of Neighbors per Individual


%% Initialization

% Create Empty Structure for Individuals

empty_individual.Position.SrcChr=[];
empty_individual.Position.DistChr=[];
empty_individual.Position.R_Src=[];
empty_individual.Position.R_Dist=[];
empty_individual.Cost=[];

% Create Population Array
pop=repmat(empty_individual,nPop,1);

% Initialize Best Solution

BestSol.Cost=0;
% Initialize Population

i=1;
% for i=1:nPop
% disp(['Initialize population ',num2str(SARUN)]);

    while(i<=nPop)
    % Initialize Position
    
%     RndChr=find(Chr(:,1)==i);
% if isempty(RndChr)
%     Emty=1;
% else
     Leftside=0;
     Rightside=0;
     PCost=0;
%      while (Leftside==Rightside && Leftside<FragmentNum && PCost==0)
       while(PCost==0)
       Leftside=randi([min(Left),max(Left)],1);
       IXR=find(X(:,1)==Leftside,1);
       if ~(isempty(IXR))
       Rightside=X(IXR,2);
       else
           Rightside=Leftside;
       end
           
%        Rightside=randi([min(Right),max(Right)],1);

%      Leftside=randi([Chr(RndChr(1),4),Chr(RndChr(end),4)],1);
%      Rightside=randi([Chr(RndChr(1),4),Chr(RndChr(end),4)],1);
% disp(['Left=',num2str(Leftside),' ','Right=',num2str(Rightside)]);
     
     pop(i).Position.R_Src=randi([1,SeqNum],1);
     pop(i).Position.R_Dist=randi([1,SeqNum],1);
      
%        pop(i).Position.R_Src=1;
%        pop(i).Position.R_Dist=1;

     if ((Leftside+pop(i).Position.R_Src)==Rightside)
     pop(i).Position.SrcChr=Leftside;
     pop(i).Position.DistChr=Rightside+1;
     else
     pop(i).Position.SrcChr=Leftside;
     pop(i).Position.DistChr=Rightside+1;
     end
%     
    % Evaluation
     [pop(i).Cost]=CostFunction(pop(i).Position);
    PCost=pop(i).Cost;
%     disp(['Cost', num2str(pop(i).Cost)]);
    % Update Best Solution
       end
% end
    if pop(i).Cost>=BestSol.Cost
        BestSol=pop(i);
    end
    i=i+1;
    end
    
%     disp(['Make Population ',num2str(SARUN)]);


% Array to Hold Best Cost Values
BestCost=zeros(MaxIt,1);

% Intialize Temp.
T=T0;
%% SA Main Loop
it=1;
% for it=1:MaxIt

while(it<=MaxIt)
    subit=1;
    while(subit<=MaxSubIt)
%     for subit=1:MaxSubIt
        
        % Create and Evaluate New Solutions
        newpop=repmat(empty_individual,nPop,nMove);
        i=1;
        while(i<=nPop)
%         for i=1:nPop
            j=1;
            while(j<=nMove)
%             for j=1:nMove
                
                % Create Neighbor
                newpop(i,j).Position=CreateNeighbor(pop(i).Position);
                
                % Evaluation
             [newpop(i,j).Cost]=CostFunction(newpop(i,j).Position);
                j=j+1;
            end
            i=i+1;
        end
        newpop=newpop(:);
        
        % Sort Neighbors
        [~, SortOrder]=sort([newpop.Cost]);
        newpop=newpop(SortOrder);
        i=1;
        while(i<=nPop)
%         for i=1:nPop
            
            if newpop(i).Cost>=pop(i).Cost
                pop(i)=newpop(i);
                
            else
                DELTA=(newpop(i).Cost-pop(i).Cost)/pop(i).Cost;
                P=exp(-DELTA/T);
                if rand<=P
                    pop(i)=newpop(i);
                end
            end
            
            % Update Best Solution Ever Found
            if pop(i).Cost>=BestSol.Cost
                BestSol=pop(i);
            end
        i=i+1;
        end
      subit=subit+1;
    end
    
    % Store Best Cost Ever Found
    BestCost(it)=BestSol.Cost;
    
    % Update Temp.
    T=alpha*T;
    it=it+1;

end

if (BestSol.Cost>0)
    IDXX(Count,1)=BestSol.Position.SrcChr;
    IDXX(Count,2)=BestSol.Position.DistChr;
    IDXX(Count,3)=BestSol.Position.R_Src;
    IDXX(Count,4)=BestSol.Position.R_Dist;
%     IDXX(Count,5)=BestSol.Cost.Out.ItractDist;
%     disp(Count);
    Count=Count+1;
end
% disp(['End of Algorithm run Iteration ',num2str(SARUN)]);
SARUN=SARUN+1;
end
Count=Count-1;

IDX=DisplayResult(X,IDXX,FragmentNum,FragmentSize);

MaxItrc=max(IDX(:,7));
MeanItc=mean(X(:,4))+50;
[IxMaxitc,~]=find(X(:,3)>MaxItrc & X(:,4)<=MeanItc,200);
% disp(IxMaxitc);
Maxitc=size(IxMaxitc,1);
for itc=1:Maxitc
   IDXX(Count,1)=X(IxMaxitc(itc),1);
   IDXX(Count,2)=X(IxMaxitc(itc),2);
   IDXX(Count,3)=1;
   IDXX(Count,4)=1;
   Count=Count+1;
end
Count=Count-1;

IDX=DisplayResult(X,IDXX,FragmentNum,FragmentSize);
IDXXX=PossibleItc(X,IDX,FragmentNum,FragmentSize);

for itc2=1:size(IDXXX,1)
   
    IDXX(Count,1)=IDXXX(itc2,1);
    IDXX(Count,2)=IDXXX(itc2,2);
    IDXX(Count,3)=IDXXX(itc2,3);
    IDXX(Count,4)=IDXXX(itc2,4);
    Count=Count+1;
end
IDX=DisplayResult(X,IDXX,FragmentNum,FragmentSize);

[row]=find(IDX(:,1)==0 & IDX(:,3)==0);
IDX(row,:)=[];

IDX=unique(IDX,'rows');

% [I]=find(IDX(:,3)==IDX(:,5));
% IDX(I,5)=IDX(I,5)+1;
% disp(toc);
toc
end



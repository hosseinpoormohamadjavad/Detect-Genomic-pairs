function [ DataHiC,DataChr ] = MOSA_HiC( D,C )
file1=D;
file2=C;
formatString1='%d %d %d %*[^\n]';
formatString2='%s %d %d %d %*[^\n]';
fidfile=fopen(file1, 'r');
HiCInteractionMatrix_1M=textscan(fidfile, formatString1, 'delimiter', '\t');
fclose(fidfile);
fidfile=fopen(file2, 'r');
HiCInteraction_Bed_1M=textscan(fidfile, formatString2, 'delimiter', '\t');
fclose(fidfile);

Sz1=size(HiCInteraction_Bed_1M{1,1},1);
Sz2=size(HiCInteractionMatrix_1M{1,1},1);

for i=1:Sz1

    if (isequal(HiCInteraction_Bed_1M{1,1}{i,1},'chr1'))
        HiCInteraction_Bed_1M{1,1}{i,1}=1;
    end
    
    if (isequal(HiCInteraction_Bed_1M{1,1}{i,1},'chr2'))
        HiCInteraction_Bed_1M{1,1}{i,1}=2;
    end
    
    if (isequal(HiCInteraction_Bed_1M{1,1}{i,1},'chr3'))
        HiCInteraction_Bed_1M{1,1}{i,1}=3;
    end
    
    if (isequal(HiCInteraction_Bed_1M{1,1}{i,1},'chr4'))
        HiCInteraction_Bed_1M{1,1}{i,1}=4;
    end
    if (isequal(HiCInteraction_Bed_1M{1,1}{i,1},'chr5'))
        HiCInteraction_Bed_1M{1,1}{i,1}=5;
    end
    
    if (isequal(HiCInteraction_Bed_1M{1,1}{i,1},'chr6'))
        HiCInteraction_Bed_1M{1,1}{i,1}=6;
    end
    if (isequal(HiCInteraction_Bed_1M{1,1}{i,1},'chr7'))
        HiCInteraction_Bed_1M{1,1}{i,1}=7;
    end
    if (isequal(HiCInteraction_Bed_1M{1,1}{i,1},'chr8'))
        HiCInteraction_Bed_1M{1,1}{i,1}=8;
    end
    if (isequal(HiCInteraction_Bed_1M{1,1}{i,1},'chr9'))
        HiCInteraction_Bed_1M{1,1}{i,1}=9;
    end
    if (isequal(HiCInteraction_Bed_1M{1,1}{i,1},'chr10'))
        HiCInteraction_Bed_1M{1,1}{i,1}=10;
    end
    if (isequal(HiCInteraction_Bed_1M{1,1}{i,1},'chr11'))
        HiCInteraction_Bed_1M{1,1}{i,1}=11;
    end
    if (isequal(HiCInteraction_Bed_1M{1,1}{i,1},'chr12'))
        HiCInteraction_Bed_1M{1,1}{i,1}=12;
    end
    if (isequal(HiCInteraction_Bed_1M{1,1}{i,1},'chr13'))
        HiCInteraction_Bed_1M{1,1}{i,1}=13;
    end
    if (isequal(HiCInteraction_Bed_1M{1,1}{i,1},'chr14'))
        HiCInteraction_Bed_1M{1,1}{i,1}=14;
    end
    if (isequal(HiCInteraction_Bed_1M{1,1}{i,1},'chr15'))
        HiCInteraction_Bed_1M{1,1}{i,1}=15;
    end
    if (isequal(HiCInteraction_Bed_1M{1,1}{i,1},'chr16'))
        HiCInteraction_Bed_1M{1,1}{i,1}=16;
    end
    if (isequal(HiCInteraction_Bed_1M{1,1}{i,1},'chr17'))
        HiCInteraction_Bed_1M{1,1}{i,1}=17;
    end
    if (isequal(HiCInteraction_Bed_1M{1,1}{i,1},'chr18'))
        HiCInteraction_Bed_1M{1,1}{i,1}=18;
    end
    if (isequal(HiCInteraction_Bed_1M{1,1}{i,1},'chr19'))
        HiCInteraction_Bed_1M{1,1}{i,1}=19;
    end
    if (isequal(HiCInteraction_Bed_1M{1,1}{i,1},'chr20'))
        HiCInteraction_Bed_1M{1,1}{i,1}=20;
    end
    if (isequal(HiCInteraction_Bed_1M{1,1}{i,1},'chr21'))
        HiCInteraction_Bed_1M{1,1}{i,1}=21;
    end
    if (isequal(HiCInteraction_Bed_1M{1,1}{i,1},'chr22'))
        HiCInteraction_Bed_1M{1,1}{i,1}=22;
    end
    if (isequal(HiCInteraction_Bed_1M{1,1}{i,1},'chrX'))
        HiCInteraction_Bed_1M{1,1}{i,1}=23;
    end
    if (isequal(HiCInteraction_Bed_1M{1,1}{i,1},'chrY'))
        HiCInteraction_Bed_1M{1,1}{i,1}=24;
    end
    if (isequal(HiCInteraction_Bed_1M{1,1}{i,1},'chrM'))
        HiCInteraction_Bed_1M{1,1}{i,1}=25;
    end
end


DataChr=zeros(Sz1,4);
DataHiC=zeros(Sz2,3);

DataChr(:,1)=cell2mat(HiCInteraction_Bed_1M{1,1});
DataChr(:,2)=HiCInteraction_Bed_1M{1,2};
DataChr(:,3)=HiCInteraction_Bed_1M{1,3};
DataChr(:,4)=HiCInteraction_Bed_1M{1,4};

DataHiC(:,1)=HiCInteractionMatrix_1M{1,1};
DataHiC(:,2)=HiCInteractionMatrix_1M{1,2};
DataHiC(:,3)=HiCInteractionMatrix_1M{1,3};





end


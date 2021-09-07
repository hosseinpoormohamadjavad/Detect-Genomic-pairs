function tour2=ApplyInsertion(tour1)

    tour2=tour1;
    
    if(tour2.SrcChr>1 && tour2.SrcChr<10)
    tour2.SrcChr=tour1.SrcChr+1;
     tour2.R_Src=tour1.R_Src+1;
    

    end
    
    if(tour2.DistChr>1 && tour2.DistChr<10)
    tour2.DistChr=tour1.DistChr+1;
    tour2.R_Dist=tour1.R_Dist+1;
    end
    
    if ((tour2.SrcChr + tour2.R_Src)== tour2.DistChr)
        tour2.DistChr=tour2.DistChr+1;
        if (tour2.DistChr>10)
           tour2.DistChr=tour2.DistChr-1; 
        end
    end
        
end
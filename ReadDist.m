function [ B ] = ReadDist( src,dist,Data )

% SZ=size(A,1);
flag=0;
% for i=1:SZ
    
    S=0;
    
    for j=src:dist
        [Ix]=find(Data(:,1)==j,1);
        
        if isempty(Ix)
            flag=1;
        else
            S=S+Data(Ix,4);
        end
        
    end
    B=S;
% end

end


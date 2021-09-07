function [ Intract ] = Multi_O_SAHiC( D,C,FragmentSize,SeqNum,Iteration )
% D is HiC dataset.
% C is details of fragment.

[ Data,DataChr ] = MOSA_HiC( D,C );

FragmentNum=size(DataChr,1);

DataH=ReadInteraction(Data,FragmentNum);

DataHiC=Preprocessing(DataH,DataChr);

[IDX]=SAOptimum10K(DataHiC,FragmentNum,FragmentSize,DataChr,SeqNum,Iteration);

Intract=IDX;

end


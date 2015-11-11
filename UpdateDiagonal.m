function H=UpdateDiagonal(LMean,AMean,BMean,bkg,H,boundaries)
K=4;
if bkg
LAB_Boun=[LMean(boundaries) AMean(boundaries) BMean(boundaries)];
[IDX C]=kmeans(LAB_Boun',K);
hist_IDX=hist(IDX,1:K);
[sorted_hist_IDX, sorted_ind]=sort(hist_IDX,'descend');
perc=[];
for next=2:K
    perc=[perc sorted_hist_IDX(next)/sorted_hist_IDX(next-1)];
end

bkg_indices=[sorted_ind(1)];
for next=2:K
    if (sorted_hist_IDX(next)>0.50*sorted_hist_IDX(next-1))||(length(find(ismember(IDX,bkg_indices)))<0.875*length(boundaries))
        bkg_indices=[bkg_indices sorted_ind(next)];
    else 
        break;
    end
end

boundaries=boundaries(find(ismember(IDX,bkg_indices)));
end

for bnd_cnt=1:length(boundaries)
    H(boundaries(bnd_cnt),boundaries(bnd_cnt))=H(boundaries(bnd_cnt),boundaries(bnd_cnt))+1;
end
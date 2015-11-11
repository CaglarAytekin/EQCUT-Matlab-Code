function ALL_DIST=DistFind(LMean,AMean,BMean,max_label)
ALL_DIST=zeros(max_label,max_label);
for label_counter=1:max_label   
    distance_all=(LMean(label_counter:end)-LMean(label_counter)).^2+(AMean(label_counter:end)-AMean(label_counter)).^2+(BMean(label_counter:end)-BMean(label_counter)).^2;
    ALL_DIST(label_counter:end,label_counter)=1./(0.00001+distance_all);
    ALL_DIST(label_counter,label_counter:end)=1./(0.00001+distance_all);
end
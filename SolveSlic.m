function [LMean, AMean, BMean, suppixel,boundaries,PixNum, LabelLine,width, height]=SolveSlic(image_now,suppix_num,m)
%Define parameters for SLIC
height=size(image_now,2);
width=size(image_now,1);
PixNum=height*width;
k=PixNum/(suppix_num.^2);


ImgAttr=[ height ,width, k, m, PixNum ];


%RUN SLIC
[ LabelLine, LMean, AMean, BMean, k ] = SLIC( image_now(:,:,1), image_now(:,:,2), image_now(:,:,3), ImgAttr );
max_max=max([max(LMean) max(AMean) max(BMean)]); LMean=LMean/max_max; AMean=AMean/max_max; BMean=BMean/max_max;
suppixel=reshape(LabelLine,width,height);

suppixel=suppixel+1;

%Finf superpixels on boundaries
boundaries=[suppixel(:,1)' suppixel(1,:) suppixel(:,end)' suppixel(end,:)];
boundaries=unique(boundaries);
clear all
close all
clc
%Define Ground Truth (GT) and Image (IM) Paths
path_IM='D:\SALIENCY_BENCHMARKS_AND_COMPARISONS\SALIENCY_BENCHMARKS\DUTUMRON5168\Images\';

%Define Output Folder (OUT) Path 
path_OUT='C:\Users\aytekin\Desktop\EQCUT_SHARE\TESTS\DUTOMRON\';

%Change the .jpg extension accordingly
contents=dir([path_IM '*.jpg']);


for i=1:length(contents)
    name=contents(i).name;
    name=name(1:end-4);
    imname=strcat(path_IM,name,'.jpg');
    image_now=(imread(imname));
    
    %if image is gray-level convert it to RGB by repeating the gray level
    %image for each channel
    if length(size(image_now))==2;
        image_now=repmat(image_now,[1 1 3]);
    end
    
    %Check if the image contains any frames and exclude them
    [image_now,w]=removeframe(image_now);
    
    %Run EQCUT for several resolutions (Original square-root of expected
    %superpixel areas: 10,15,20 and regularizer 20 is kept, for images
    %around 300x400) For larger/smaller images, please consider changing
    %these prameters.
    [SalMapRes1]=EQCUT(image_now,10,20,1,1);
    [SalMapRes2]=EQCUT(image_now,15,20,1,1);
    [SalMapRes3]=EQCUT(image_now,20,20,1,1);
    
    %Average Over Resolutions
    SalMap=mat2gray(SalMapRes1)+mat2gray(SalMapRes2)+mat2gray(SalMapRes3);
    
    %Map Back to the Original Image (if frames were excluded)
    SalMapOrig=zeros(w(1),w(2));
    SalMapOrig(w(3):w(4),w(5):w(6))=SalMap;
    
    %Discretize the Saliency Map to uint8 format
    SalMapFinal=uint8(mat2gray(SalMapOrig)*255);
    
    %Save the result
    imwrite(SalMapFinal,[path_OUT name '_EQCUT.png']);
    
end

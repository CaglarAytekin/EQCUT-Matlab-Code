function [neighbourhood,length_final_neighbours,max_label]=FindNeighbours(suppixel)

max_label=max(suppixel(:));
neighbourhood=struct;

neighbourx1=suppixel; neighbourx2=suppixel; neighboury1=suppixel; neighboury2=suppixel;
neighbourx1(2:end,:)=suppixel(1:end-1,:); NX1stats=regionprops(suppixel,neighbourx1,'PixelValues');
neighbourx2(1:end-1,:)=suppixel(2:end,:); NX2stats=regionprops(suppixel,neighbourx2,'PixelValues');
neighboury1(:,2:end)=suppixel(:,1:end-1); NY1stats=regionprops(suppixel,neighboury1,'PixelValues');
neighboury2(:,1:end-1)=suppixel(:,2:end); NY2stats=regionprops(suppixel,neighboury2,'PixelValues');

final_neighbours=cell(1,max_label);
for label_counter=1:max_label
    neighbours=zeros(1,max_label);
    neighbours([NX1stats(label_counter).PixelValues; NX2stats(label_counter).PixelValues; NY1stats(label_counter).PixelValues; NY2stats(label_counter).PixelValues])=1;
    neighbours(label_counter)=0;
    final_neighbours{label_counter}=find(neighbours);
end

%FIRST NEIGHBOURHOOD
first_neighbourhood=final_neighbours;
%------------
%

final_neighbours2=cell(1,max_label);
second_neighbourhood=cell(1,max_label);
for label_counter=1:max_label
    neighbours=(final_neighbours{label_counter});
    neighbours2=zeros(1,max_label);
    neighbours2(neighbours)=1;
    neighbours2(cell2mat(final_neighbours(neighbours)))=1;
    neighbours2(label_counter)=0;
    final_neighbours2{label_counter}=find(neighbours2);
    neighbours2(neighbours)=0;
    second_neighbourhood{label_counter}=find(neighbours2);
end

final_neighbours=final_neighbours2;
%
%
%
%

third_neighbourhood=cell(1,max_label);

final_neighbours2=cell(1,max_label);
for label_counter=1:max_label
    neighbours=(final_neighbours{label_counter});
    neighbours2=zeros(1,max_label);
    neighbours2(neighbours)=1;
    neighbours2(cell2mat(final_neighbours(neighbours)))=1;
    neighbours2(label_counter)=0;
    final_neighbours2{label_counter}=find(neighbours2);
    neighbours2(neighbours)=0;
    third_neighbourhood{label_counter}=find(neighbours2);
    
end

final_neighbours=final_neighbours2;




fourth_neighbourhood=cell(1,max_label);

final_neighbours2=cell(1,max_label);
for label_counter=1:max_label
    neighbours=(final_neighbours{label_counter});
    neighbours2=zeros(1,max_label);
    neighbours2(neighbours)=1;
    neighbours2(cell2mat(final_neighbours(neighbours)))=1;
    neighbours2(label_counter)=0;
    final_neighbours2{label_counter}=find(neighbours2);
    neighbours2(neighbours)=0;
    fourth_neighbourhood{label_counter}=find(neighbours2);
    
end

final_neighbours=final_neighbours2;


fifth_neighbourhood=cell(1,max_label);

final_neighbours2=cell(1,max_label);
for label_counter=1:max_label
    neighbours=(final_neighbours{label_counter});
    neighbours2=zeros(1,max_label);
    neighbours2(neighbours)=1;
    neighbours2(cell2mat(final_neighbours(neighbours)))=1;
    neighbours2(label_counter)=0;
    final_neighbours2{label_counter}=find(neighbours2);
    neighbours2(neighbours)=0;
    fifth_neighbourhood{label_counter}=find(neighbours2);
    
end

final_neighbours=final_neighbours2;
length_final_neighbours=cellfun('length',final_neighbours);



neighbourhood.First=first_neighbourhood;
neighbourhood.Second=second_neighbourhood;
neighbourhood.Third=third_neighbourhood;
neighbourhood.Fourth=fourth_neighbourhood;
neighbourhood.Fifth=fifth_neighbourhood;
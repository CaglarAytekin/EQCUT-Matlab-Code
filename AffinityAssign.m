function H=AffinityAssign(neighbourhood,length_final_neighbours,ALL_DIST, max_label)

%Initialize Hamiltonian
H=zeros(max_label,max_label);

first_neighbourhood=neighbourhood.First;
second_neighbourhood=neighbourhood.Second;
third_neighbourhood=neighbourhood.Third;
fourth_neighbourhood=neighbourhood.Fourth;
fifth_neighbourhood=neighbourhood.Fifth;

length_first_neighbours=cellfun('length',first_neighbourhood);
length_second_neighbours=cellfun('length',second_neighbourhood);
length_third_neighbours=cellfun('length',third_neighbourhood);
length_fourth_neighbours=cellfun('length',fourth_neighbourhood);
length_fifth_neighbours=cellfun('length',fifth_neighbourhood);




for label_counter=1:max_label
    neighbours=(first_neighbourhood{label_counter});
    length_neighbours=length_first_neighbours(label_counter);
    %     MIN_UPDATE=Inf;
    for neighbour_counter=1:length(neighbours)
        
        dist=ALL_DIST(label_counter,neighbours(neighbour_counter));
        mean_norm=(length_neighbours*length_final_neighbours(neighbours(neighbour_counter))).^2;%+(length_first_neighbours(neighbours(neighbour_counter))*length_final_neighbours(label_counter)).^2;
        %         mean_norm=mean_norm./2;
        UPDATE=dist/(mean_norm);
        %         UPDATE=UPDATE+dist/(mean_norm^2);
        H(label_counter,neighbours(neighbour_counter))=-UPDATE;
        H(label_counter,label_counter)=H(label_counter,label_counter)+UPDATE;
    end
    
    
    neighbours=(second_neighbourhood{label_counter});
    length_neighbours=length_second_neighbours(label_counter);
    
    %     MIN_UPDATE=Inf;
    for neighbour_counter=1:length(neighbours)
        dist=ALL_DIST(label_counter,neighbours(neighbour_counter));
        mean_norm=(length_neighbours*length_final_neighbours(neighbours(neighbour_counter))).^2;%+(length_second_neighbours(neighbours(neighbour_counter))*length_final_neighbours(label_counter)).^2;
        %         mean_norm=mean_norm./2;
        UPDATE=dist/(mean_norm);
        %         UPDATE=UPDATE+dist/(mean_norm^2);
        H(label_counter,neighbours(neighbour_counter))=-UPDATE;
        H(label_counter,label_counter)=H(label_counter,label_counter)+UPDATE;
    end
    
    
    neighbours=(third_neighbourhood{label_counter});
    length_neighbours=length_third_neighbours(label_counter);
    
    %     MIN_UPDATE=Inf;
    for neighbour_counter=1:length(neighbours)
        dist=ALL_DIST(label_counter,neighbours(neighbour_counter));
        mean_norm=(length_neighbours*length_final_neighbours(neighbours(neighbour_counter))).^2;%+(length_third_neighbours(neighbours(neighbour_counter))*length_final_neighbours(label_counter)).^2;
        %         mean_norm=mean_norm./2;
        UPDATE=dist/(mean_norm);
        %         UPDATE=UPDATE+dist/(mean_norm^2);
        H(label_counter,neighbours(neighbour_counter))=-UPDATE;
        H(label_counter,label_counter)=H(label_counter,label_counter)+UPDATE;
    end
    
    
    
    
    
    neighbours=(fourth_neighbourhood{label_counter});
    length_neighbours=length_fourth_neighbours(label_counter);
    
    %     MIN_UPDATE=Inf;
    for neighbour_counter=1:length(neighbours)
        dist=ALL_DIST(label_counter,neighbours(neighbour_counter));
        mean_norm=(length_neighbours*length_final_neighbours(neighbours(neighbour_counter))).^2;%+(length_fourth_neighbours(neighbours(neighbour_counter))*length_final_neighbours(label_counter)).^2;
        %         mean_norm=mean_norm./2;
        UPDATE=dist/(mean_norm);
        %         UPDATE=UPDATE+dist/(mean_norm^2);
        H(label_counter,neighbours(neighbour_counter))=-UPDATE;
        H(label_counter,label_counter)=H(label_counter,label_counter)+UPDATE;
    end
    
    
    
    neighbours=(fifth_neighbourhood{label_counter});
    length_neighbours=length_fifth_neighbours(label_counter);
    
    %     MIN_UPDATE=Inf;
    for neighbour_counter=1:length(neighbours)
        dist=ALL_DIST(label_counter,neighbours(neighbour_counter));
        mean_norm=(length_neighbours*length_final_neighbours(neighbours(neighbour_counter))).^2;%+(length_fifth_neighbours(neighbours(neighbour_counter))*length_final_neighbours(label_counter)).^2;
        %         mean_norm=mean_norm./2;
        UPDATE=dist/(mean_norm);
        %         UPDATE=UPDATE+dist/(mean_norm^2);
        H(label_counter,neighbours(neighbour_counter))=-UPDATE;
        H(label_counter,label_counter)=H(label_counter,label_counter)+UPDATE;
    end
    
    %
end


H=-H/min(min(H));
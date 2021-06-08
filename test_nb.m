%Testing Naive_Bayes
function [predicted,S]=test_nb(P_train,mu,h,u,nc,ni)
    K=[];
    
    ns=length(u); % Number of points

    %Calculate kernel. 
    for j=1:nc
        for k=1:ni
            for r=1:ns
                ui=u(:,k);
                K(r,:)=1/sqrt(2*pi)*exp(-1/2*(mu(j,k)-ui(r,:)).^2/(h(j,k)).^2);%Kernel
                fuStruct(j,k).f=K;
            end
        end
    end


    for r=1:ns
        for j=1:nc
            for k=1:ni
                fuRestruct(j,k)=fuStruct(j,k).f(r);
            end
        end
        P(r,:)=P_train.*prod(fuRestruct,2)';
    end

	% predicted labels, S- vector max values of P
    S=[];
    predicted=[];
    for r=1:ns
        Max=P(r,1);
        Ind_max=1;
        for j=1:nc
            if P(r,j) > Max
                Max=P(r,j);
                Ind_max=j;
            end
        end
        S(r,:)=Max;
        predicted(r,:)= Ind_max;
    end
end
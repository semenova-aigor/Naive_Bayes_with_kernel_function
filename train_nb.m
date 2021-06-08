%Training Naive Bayes

function [P_train,mu,h]=train_nb(x,y,yu,nc,ni)

    ns=length(x); % Number of points

    % Calculation of the probability of belonging to a class. 
    for i=1:nc
        P_train(i)=sum(double(y==yu(i)))/length(y);
    end

    %nc-number of classes, ni-number of features
    %Сalculation of the training parameters mu and h.

    mu=[];
    h=[];
    for j=1:nc
          for k=1:ni
               class=x(y==yu(j),k);
               sigma(j,k)=std(class);
               h(j,k)=1.06*sigma(j,k)*ns^(-1/5);
               mu(j,k)=mean(class);
          end
    end
end
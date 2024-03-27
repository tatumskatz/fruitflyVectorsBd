function [L,params]=AmyNBfun(params)
% returns -log likelihood of NB model for given values of beta,kk

global SS II notinf ExpTau

    beta=params(1);
    kk=params(2);

    L=0;
    for rep=1:length(SS)
        x=0:SS(rep);
        n=SS(rep)*ones(1,(SS(rep)+1));
        p_rep = (1+beta*II(rep))^(-kk*ExpTau)*ones(1,(SS(rep)+1));
        Y_rep = binopdf(x,n,p_rep);
      
        L=L-log(Y_rep(notinf(1,rep)+1));

    end %for rep


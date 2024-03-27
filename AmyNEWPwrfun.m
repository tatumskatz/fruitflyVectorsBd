function [L,params]=AmyNEWPwrfun(params)
% returns -log likelihood of Power function model for a given value of beta
global SS II notinf ExpTau
    
    beta=params(1);
    alpha=params(2);
    zeta=params(3);

    L=0;
    for rep=1:length(SS)
        x=0:SS(rep);
        n=SS(rep)*ones(1,(SS(rep)+1));
        p_rep = exp(-beta*ExpTau*II(rep)^alpha*SS(rep)^(zeta-1.0))*ones(1,(SS(rep)+1));
        Y_rep = binopdf(x,n,p_rep);
      
        L=L-log(Y_rep(notinf(1,rep)+1));

    end %for rep


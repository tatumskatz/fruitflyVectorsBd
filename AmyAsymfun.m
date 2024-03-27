function [L,params]=AmyAsymfun(params)
% returns -log likelihood of Asymptotic model for given values of beta,cc

global SS II notinf ExpTau

    beta=params(1);
    cc=params(2);

    L=0;
    for rep=1:length(SS)
        x=0:SS(rep);
        n=SS(rep)*ones(1,(SS(rep)+1));
        p_rep = exp(-beta*ExpTau*II(rep)/(cc+SS(rep)+II(rep)))*ones(1,(SS(rep)+1));
        Y_rep = binopdf(x,n,p_rep);
      
        L=L-log(Y_rep(notinf(1,rep)+1));

    end %for rep


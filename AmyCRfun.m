function [L,beta]=AmyCRfun(beta)
% returns -log likelihood of Constant Risk model for a given value of beta
global SS II notinf ExpTau
    
    L=0;
    for rep=1:length(SS)
        x=0:SS(rep);
        n=SS(rep)*ones(1,(SS(rep)+1));
        p_rep = exp(-beta*ExpTau)*ones(1,(SS(rep)+1));
        Y_rep = binopdf(x,n,p_rep);
      
        L=L-log(Y_rep(notinf(1,rep)+1));

    end %for rep


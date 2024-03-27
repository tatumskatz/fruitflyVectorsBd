clear all;
warning off MATLAB:nchoosek:LargeCoefficient
format compact
format long
global SS II notinf ExpTau
% Amy Greer's data 
ExpTau = 1;
SS=[7,14,26,3,6,9,12,25,1,2,3,4,5,6,7,8,9,16];
II=    [1,2,8,1,2,3,4,9,1,2,3,4,5,6,7,8,9,15];
endinf=[1,1,7,1,3,2,4,0,1,1,2,4,2,0,13,5,6,24];
newinf=[0,0,0,0,1,0,0,0,0,0,0,0,0,0,6,0,0,8];
notinf=SS-newinf;

    [beta_CR,Lmin_CR] = fminbnd('AmyCRfun',0.01,5);
    AIC_CR= 2*Lmin_CR+2*1;
    cAIC_CR = 2*Lmin_CR+2*1*(24/(24-1-1));
    
    [beta_MA,Lmin_MA] = fminbnd('AmyMAfun',0.002,0.5);
    AIC_MA= 2*Lmin_MA+2*1;
    cAIC_MA = 2*Lmin_MA+2*1*(24/(24-1-1));
    
    [beta_FD,Lmin_FD] = fminbnd('AmyFDfun',1,24);
    AIC_FD= 2*Lmin_FD+2*1;
    cAIC_FD = 2*Lmin_FD+2*1*(24/(24-1-1));
    
    % power just on I
    [params,Lmin_Pwr,exitflag] = fminsearch('AmyPwrfun',[1,0.2]);
    exitflag
    beta_Pwr=params(1);
    alpha_Pwr=params(2);
    AIC_Pwr= 2*Lmin_Pwr+2*2;
    cAIC_Pwr = 2*Lmin_Pwr+2*2*(24/(24-2-1));
    
    % power on I and S 
    %[params,Lmin_NEWPwr,exitflag] = fminsearch('AmyNEWPwrfun',[1,0.2,0.1]);
    %exitflag
    %beta_Pwr=params(1);
    %alpha_Pwr=params(2);
    %zeta_Pwr=params(3)
    %AIC_NEWPwr= 2*Lmin_NEWPwr+2*3;
    %cAIC_NEWPwr = 2*Lmin_NEWPwr+2*3*(24/(24-3-1));
 
       %wwww = 2*Lmin_NEWPwr+2*3+2*3*(3+1)/(24-3-1);

    
    [params,Lmin_Asym,exitflag] = fminsearch('AmyAsymfun',[50,150], optimset('TolX',1e-12,'MaxFunEvals',10000));
         exitflag
         beta_Asym=params(1);
         cc_Asym=params(2);
         AIC_Asym= 2*Lmin_Asym+2*2;
        cAIC_Asym = 2*Lmin_Asym+2*2*(24/(24-2-1));

         
    [params,Lmin_NB,exitflag] = fminsearch('AmyNBfun',[7,0.02],optimset('TolX',1e-12,'MaxFunEvals',10000));                  
          exitflag
          beta_NB=params(1);
          kk_NB=params(2);
          AIC_NB= 2*Lmin_NB+2*2;
        cAIC_NB = 2*Lmin_NB+2*2*(24/(24-2-1));
          
     AIC_CR
     AIC_MA
     AIC_FD
     AIC_Pwr
     %AIC_NEWPwr
     AIC_Asym
     AIC_NB  
     
     cAIC_CR
     cAIC_MA
     cAIC_FD
     cAIC_Pwr
     cAIC_Asym
     cAIC_NB
     
     beta_CR
     beta_MA
     beta_FD
     beta_Pwr
     alpha_Pwr
     beta_Asym
     cc_Asym
     beta_NB
     kk_NB

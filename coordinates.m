function [RAnew,DECnew]=coordinates(pd1,pd2,ranRA,ranDEC)

%eliminated the binwidth from the code temp. but used implicitly


load RandomSDSS.mat

%dist1=1.5473e+03; % PropDist at redshift Z=0.4

%tolerance=167.9885; %PropDist at redshift binwidth at Z=0.04

load ranproperdist;

k=1;   %count

   
      for j=1:length(ranproperdist)
    
             if (ranproperdist(j)>=pd1) && (ranproperdist(j)<=pd2)
                RAnew(k)=  ranRA(j);
                DECnew(k)= ranDEC(j);
    
                k=k+1;
    
             end
    
      end
%              if abs(pd1-properdist(j))<=pd2
 %               RAnew(k)=RA(j);
  %              DECnew(k)=DEC(j);
    
   %             k=k+1;
    
       
%end


end


        
        
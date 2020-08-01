function finresults


%FINAL 05/07/2018

properdistance=[1.5473;1.7196;1.8871;2.0501;2.2086;2.3626;2.5124;2.6579];

%hurstexponent of real data at depth 4 for all z's, calculated from the slopes

hurstexpall4=abs([ ]+3)/2

 
 %Mock galaxies
 hurstexponents=abs([ ]+3)/2
 
 
 %thefit=[0.2896;0.340452;0.341446;0.342258;0.339402;0.3406;0.3432;0.3317]/sqrt(8)
 
 %standarddeviations=[std(hurstofall1);std(hurstofall2);std(hurstofall3);std(hurstofall4);
  %    std(hurstofall5);std(hurstofall6)]
  
  %std(hurstofall7);std(hurstofall8)]
% 

  %err=thefit
  
  e=[0.2896;0.340452;0.341446;0.342258;0.339402;0.3406;0.3432;0.3317]./sqrt(8)
  
  errorbar(properdistance,hurstexponents,e,'.b','MarkerSize',18) 
  
  %title ('ProperDistance vs Hurst exponent (H)','FontSize',14,'FontWeight','bold','Color','r')
  %xlabel ('ProperDistance','FontSize',14,'FontWeight','bold','Color','k')
  %ylabel ('Hurst exponent (H)','FontSize',14,'FontWeight','bold','Color','k')
 
   xlim([0.35 0.8])
  
   ylim([0 1.2])
 
 
   
   
  % range=[0.132;0.19;0.22442;0.2745;0.24472;0.2373;0.18815;0.17927]/sqrt(8)
   
  % err=range
    
    plot(properdistance,hurstexpall4,'.k','MarkerSize',18)
    title ('ProperDistance vs. Hurst exponent (H)','FontSize',14,'FontWeight','bold','Color','r')
    xlabel ('ProperDistance','FontSize',14,'FontWeight','bold','Color','k')
    ylabel ('Hurst exponent (H)','FontSize',14,'FontWeight','bold','Color','k')
   
   %legend ('Mock Galaxies Catalogs','Real Distribution of Galaxies')
% 

% fractaldimreal=2-hurstexpall4
% 
% fractaldimmock=2-hurstexponents
% 
% fractaldimmockrange=[std(3-hurstofall1);std(3-hurstofall2);std(3-hurstofall3);std(3-hurstofall4)
%     ;std(3-hurstofall5);std(3-hurstofall6);std(3-hurstofall7);std(3-hurstofall8)]
% 
%  err=fractaldimmockrange
% 
% 
%  errorbar(redshift,fractaldimmock,err,'.b','MarkerSize',18); hold on
%  title ('Redshift (Z) vs Fractal Dimension (D)','FontSize',14,'FontWeight','bold','Color','r')
%  xlabel ('Redshift (Z)','FontSize',14,'FontWeight','bold','Color','k')
%  ylabel ('Fractal Diemension (D)','FontSize',14,'FontWeight','bold','Color','k')
 
%  xlim([0.4 0.85])
  
%  ylim([0 4])
   
%  plot(redshift,fractaldimreal,'.k','MarkerSize',18)
%  title ('Redshift (Z) vs. Fractal Dimension (D)','FontSize',14,'FontWeight','bold','Color','r')
%  xlabel ('Redshift (Z)','FontSize',14,'FontWeight','bold','Color','k')
%  ylabel ('Fractal Dimension (D)','FontSize',14,'FontWeight','bold','Color','k')

end


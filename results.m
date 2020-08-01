function [hurst1,hurst2,fracdim1,fracdim2]=results(slopes1,fit1,slopes2,fit2)

properdistance=[1.7196;1.8871;2.0501;2.2086;2.3626;2.5124]*10^3;
    %ast 1.5473;  ;2.5124;2.6579; last ;2.6579]
    
     for i=1:length(slopes1)
              if (slopes1(i)>= -1) 
             hurst1(i)=(slopes1(i) +1)/2;
              elseif (slopes1(i) < -1)
                  hurst1(i)= (slopes1(i) +3)/2;
              end
     end
    
   
      for j=1:length(slopes2)
              if (slopes2(j)>= -1) 
             hurst2(j)=(slopes2(j) +1)/2;
              elseif (slopes2(j) < -1)
                  hurst2(j)=(slopes2(j) +3)/2;             
              end 
      end
 
     
errorbar(properdistance,hurst1,fit1,'.k','MarkerSize',18); hold on
%title('Proper Distance vs Hurst Exponent', 'FontSize',14,'FontWeight','bold','Color','r')
xlabel('Proper Distance','FontSize',14,'FontWeight','bold','Color','k')
ylabel('Hurst Exponent H','FontSize',14,'FontWeight','bold','Color','k')

   xlim([1.5 2.8]*10^3)
   ylim([0 1.1])

%hurst2=slopes2-1/2;

errorbar(properdistance,hurst2,fit2,'.b','MarkerSize',18)
%title('Proper Distance vs Hurst Exponent', 'FontSize',14,'FontWeight','bold','Color','r')
xlabel('Proper Distance','FontSize',14,'FontWeight','bold','Color','k')
ylabel('Hurst Exponent H','FontSize',14,'FontWeight','bold','Color','k')

legend('Real BOSS Galaxies','Mock Galaxies')
legend('Location','northoutside')
figure

fracdim1=2-hurst1

fracdim2=2-hurst2

errorbar(properdistance,fracdim1,fit1,'.k','MarkerSize',18); hold on
%title('Proper Distance vs Hurst Exponent', 'FontSize',14,'FontWeight','bold','Color','r')
xlabel('Proper Distance','FontSize',14,'FontWeight','bold','Color','k')
ylabel('Fractal Dimension D','FontSize',14,'FontWeight','bold','Color','k')

  xlim([1.5 2.8]*10^3)
  ylim([-0.1 2])

%hurst2=slopes2-1/2;

errorbar(properdistance,fracdim2,fit2,'.b','MarkerSize',18)
%title('Proper Distance vs Hurst Exponent', 'FontSize',14,'FontWeight','bold','Color','r')
xlabel('Proper Distance','FontSize',14,'FontWeight','bold','Color','k')
ylabel('Fractal Dimension D','FontSize',14,'FontWeight','bold','Color','k')


legend('Real BOSS Galaxies','Mock Galaxies')
legend('Location', 'northoutside')
end



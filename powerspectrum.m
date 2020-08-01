function finpower=powerspectrum(data)
tic 
 
%  load RealSDSS.mat;
 
 
% checking to see that depth is appropriate

%nm=length(data)

 %if((nm/4^(jn+2)<1 || nextpow2(min(lx,ly)/2^jn) <=1)) % what are lx,ly, why min, <=1?
  
 %error('Error ---> Input data set does not have enough samples: consider a smaller jn.');
 %end

jn=4; % the depth (no. of sweeps=5)

p=0:1:2^jn-1; % this creates a vector from zero up to 2^5 -1 (31) with increments of 1.

[fv1,fv2] = meshgrid(p/2^jn); % creates the frequency grid
% each of fv1 and fv2 is 32*32 matrix. For fv1 each row is 
% a copy of (p/32), on the other side, each column in fv2
% is a copy of (p/32). See supported explanation in 
% thesis reports.

n=bitxor(p,fix(p/2));
% creates a vector has 32 entries using bitxor command. Each pair consists 
% of p and fix(p/2) where p starts from 0 and goes up to 31 as defined 
% above. Example, at p=1: bitxor(1, fix(1/2))= bitxor(1,0)=1
% another example, at p=2: bitxor(2,fix(2/2)= bitxor(2,1)=3

tab=[ 1 2; 3 4];  % creates a table with entries 1 2 3 4 like the following
   % 1 2
   % 3 4 


for u = 1:jn - 1  % creates a vector from 1 to 31

tab= [tab tab+4^u];

end

for v=1:jn -1

tab=[tab; tab+2*4^v];

end

T= wpdec2(data,jn,'db1');

PS=zeros(2^jn,2^jn);

for p1 = 1:2^jn

for p2 = 1:2^jn

Cjk=wpcoef(T,[jn -1+tab(n(p1)+1,n(p2)+1)]);  % getting the appropriate coefficients

PS(p1,p2)=var(Cjk(:)); % power spectrum

end

end

% surf(fv1,fv2,PS)
% title (' Three dimensional plot of the power with frequencies along x and y directions')
% xlabel ('Frequency along the x direction')
% ylabel ('Frequency along the y direction')
% zlabel ('Power')
% 

[kx,ky]=size(PS);

[~,rho]=cart2pol(1:kx,1:ky);

minrho=1/rho(2);

rho=rho.*minrho;

sz=length(PS);

rho=round(rho);

i=cell(sz+1,1);

radavgps=zeros(sz+1,1);

eradavgps=zeros(sz+1,1);

for r=0:sz
    i{r+1}=find(rho==r);
end

for r=0:sz
 
   radavgps(r+1)= nanmean(PS(i{r+1}));

   eradavgps(r+1)= nanstd(PS(i{r+1}));
end

% dbstop if naninf

xfreq=diag(fv1);

yfreq=diag(fv2);

avgfreq=sqrt(xfreq.^2+yfreq.^2);

finfreq=avgfreq(1:16)

finpower=radavgps(1:16)
 


mdl=fitlm(log(finfreq),log(finpower))

       finpower(isnan(finpower(:,1)),:)=[]
      
       finpower=finpower(2:8)
         
       newlen=length(finpower)
      
       finfreq=finfreq(1:newlen)
    
    finfreq(1)=0.01

%  [f,gof]=fit(log(finfreq),log(finpower),'poly1');
%  gof.rsquare
%  f.p1

%finerr=eradavgps(2:17);


 


 myfit=fit(log(finfreq),log(finpower),'poly1')

 
  
%plot(log(finfreq),log(finpower),'.k','MarkerSize',18)
  plot(finfreq,finpower, '.k', 'MarkerSize',18)
  title ('Power Spectrum at Z=0.55','FontSize',14,'FontWeight','bold','Color','r')
  xlabel ('Average Frequency K','FontSize',14,'FontWeight','bold','Color','k')
  ylabel ('Power Spectrum P_k','FontSize',14,'FontWeight','bold','Color','k')

%rsquare 
 
toc
end
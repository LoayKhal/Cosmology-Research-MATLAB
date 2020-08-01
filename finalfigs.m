function finalfigs

properdistance=[1.5473;1.7196;1.8871;2.0501;2.2086;2.3626;2.5124;2.6579]*10^3;

% for real resolution 16 
hurst1=[0.1965;06480;0.6648;0.6172;0.6222;0.5945;0.8560;0.8730];

% for real the error
fit1=[0.05214;0.1719;0.081;0.1430;0.0846;0.1332;0.00125;0.0877]

% for random resolution 16 
hurst2=[0.2780;0.1000;0.1072;0.0917;0.1095;0.1684;0.2506;0.4086]; 

% for random errors
fit2=[0.4837;0.3753;0.643;0.649;0.6376;0.5747;0.5072;0.4042]/sqrt(8)


% for real resolution 32
%hurst1=[0.3789;0.0954;0.84475;0.8431;0.89225;0.947;0.0564;0.2283];

%for real errors
%fit1=[0.0516;0.0466;0.0390;0.1150;0.0485;0.0918;0.0613;0.0746]

% for random resolution 32
%hurst2=[0.977;0.5114;0.2851;0.2739;0.2932;0.37265;0.49805;0.69135];

% for random errors
%fit2=[0.0563;0.1176;0.1884;0.0855;0.1864;0.1493;0.1249;0.0842]


% for real resolution 64 
%hurst1=[0.4453;0.2358;0.0430;0.0065;0.0314;0.1475;0.2237;0.3517];

% for real error
%fit1=[0.0304;0.080155;0.077525;0.07531;0.07058;0.04009;0009787;0.0455]

% for random resolution 64
%hurst2=[0.1955;0.8224;0.5613;0.5296;0.5907;0.6777;0.8153;0.0017];

% for random error
%fit2=[0.02368;0.0448;0.09121;0.10037;0.08257;0.06081;0.04301;0.04984]


errorbar(properdistance,hurst1,fit1,'.b','MarkerSize',18);hold on
title('Proper Distance vs Hurst Exponent', 'FontSize',14,'FontWeight','bold','Color','r')
xlabel('Proper Distance','FontSize',14,'FontWeight','bold','Color','k')
ylabel('Hurst Exponent H','FontSize',14,'FontWeight','bold','Color','k')

xlim([1.4 2.8])
ylim([0 1.2])

errorbar(properdistance,hurst2,fit2,'.k','MarkerSize',18)
title('Proper Distance vs Hurst Exponent', 'FontSize',14,'FontWeight','bold','Color','r')
xlabel('Proper Distance','FontSize',14,'FontWeight','bold','Color','k')
ylabel('Hurst Exponent H','FontSize',14,'FontWeight','bold','Color','k')

legend('Mock Galaxies','Real SDSS Galaxies')

end
h = figure 
plot (dates,R_plot(:,1),'-','MarkerSize',6,'Color',colorset(5))
ylim([0 10000])
xlabel ('Distances in AU');
ylabel ('consequential data rate in bit/s');
ax1 = gca;
ax1_pos = ax1.Position;
ax2 = axes('Position',ax1_pos,...
    'XAxisLocation','top',...
    'YAxisLocation','right',...
    'Color','none');
%Eliminating second y-Axis
set(gca,'ytick',[])
% With AU_ent as the distances in AU
x2 = AU_ent;
%Random value
y2 = 0;
line(x2,y2,'Parent',ax2,'Color','k')




x1=1:0.1:10
x2=1:0.1:10
y1=sin(x1)
y2=cos(x2)./x2
[ax,h1,h2] = plotyy(x1,y1,x2,y2)
xlabel('u(m/s)')
ylabel('y(mm)')
set(ax(2),'xaxislocation','top')
hlx=get(ax(2),'xlabel')
set(hlx,'string','x(mm)')


hAX=axes;                 % first axes, save handle
pos=get(hAX,'position')   % get the position vector
pos =
  0.1300    0.1100    0.7750    0.8150
pos1=pos(2);              % save the original bottom position
pos(2)=pos(2)+pos1; pos(4)=pos(4)-pos1;  % raise bottom/reduce height->same overall upper position
set(hAX,'position',pos)   % and resize first axes
pos(2)=pos1; pos(4)=0.01; % reset bottom to original and small height
hAX(2)=axes('position',pos,'color','none');  % and create the second
ylabel(hAX(1),'Axes 1')
xlabel(hAX(1),'Axes 1')
xlabel(hAX(2),'Axes 2')
set(haX(2),'xcolor','r','ycolor','r')
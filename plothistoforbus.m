%% plot those histos
close all; clear all;

load('onebusto12');
h= figure
filename = 'onebusanim.gif';

for l = 1:1:numel(listindex)
histogram(endlist{l}, 'Normalization', 'probability');
title( ['min ',num2str(l), ', max ', num2str(listmax(l))] );
xlabel('how long the ride is')
ylabel('frequency, per million tries');
% pause(.25);
% waitforbuttonpress;
      frame = getframe(h); 
      im = frame2im(frame); 
      [imind,cm] = rgb2ind(im,256); 
      % Write to the GIF File 
      if l == 1 
          imwrite(imind,cm,filename,'gif', 'Loopcount',inf); 
      else 
          imwrite(imind,cm,filename,'gif','WriteMode','append'); 
      end 



end

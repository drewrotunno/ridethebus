%% rules of ride the train:
% ???? A-2-3-4-5-6-7-8-9-10-J-Q-K
% shuffle a deck of cards (order matters, one deck at a time)
% lay out 8/10  ( min safe number or something )
% and flip one by one:
% if Jack,  add 1 to total number to flip
% if Queen, add 2 to total number to flip
% if King,  add 3 to total number to flip
% if Ace,   add 4 to total number to flip
% want to know: what is the average / median / mode of train routes
clear all; close all; 

numcards = 52;
numtorepeat = 1e6;
whentogetoff = 12;

endlist = cell(whentogetoff, 1);
listindex = zeros(whentogetoff,1);
listmedian = zeros(whentogetoff,1);
listmean = zeros(whentogetoff,1);
liststdev = zeros(whentogetoff,1);
listmode = zeros(whentogetoff,1);
listmax = zeros(whentogetoff,1);


figure('position', [162 364 1319 452]);

% figure;
for n = 1:1:whentogetoff
    for m = 1:1:numtorepeat
        endstops = n;
        stop = 0;
        while stop<endstops
            %if we've run out shuffle
            if mod(stop,numcards)==0
                deck = randperm(numcards)';
%                 if(stop>52)
%                     disp('SHUFFLE!')
%                 end
            end
            stop = stop +1; % flip that shit 
            b = mod(stop,numcards)+1;
            val  = mod(deck(b),13)+1;
            switch val
                case 1
                    endstops = endstops + 4;
                case 11
                    endstops = endstops + 1;
                case 12
                    endstops = endstops + 2;
                case 13
                    endstops = endstops + 3;
            end
        end
        endlist{n}(m) = endstops;
    %     histogram(endlist);
    %     pause(.001);
%         if round(100*m/numtorepeat)==100*m/numtorepeat
%             disp([num2str(100*m/numtorepeat), ' %']);
%         end
    end
    disp(n)
    listindex(n) = n;
    listmedian(n) = median(endlist{n});
    listmean(n) = mean(endlist{n});
    liststdev(n) = std(endlist{n});
    listmode(n) = mode(endlist{n});
    listmax(n) = max(endlist{n});
% end

subplot(1,3,1);title('median');
plot(listindex, listmedian, 'x-');

subplot(1,3,2);title('Mean +- STD');
errorbar(listindex, listmean, liststdev, 'x-');

subplot(1,3,3);title('max');
plot(listindex, listmax, 'x-');
        pause(.01);

end

    
function printcard(b, deck)
    valname  = {'ACE','two','three','four','five','six','seven','eight','nine','ten','JACK','QUEEN','KING'};
    suitname = {'spades','hearts','clubs','diamonds'};
    val  = mod(deck(b),13)+1;
    suit = mod(deck(b),4)+1;
    disp([valname{val},' of ',suitname{suit}]);
end

    
%     disp(['MEDIAN - ', num2str(median(endlist))]);
%     disp(['MEAN   - ', num2str(mean(endlist))]);
%     disp(['STdev  - ', num2str(std(endlist))]);
%     disp(['MODE   - ', num2str(mode(endlist))]);

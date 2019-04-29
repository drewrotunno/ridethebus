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
% deck     = randperm(numcards)';
% numtorepeat = 

endstops = 10;
stop = 0;

while stop<endstops
   
    %if we've run out shuffle
    if mod(stop,numcards)==0
        deck = randperm(numcards)';
        disp('SHUFFLE!');
    end
    stop = stop +1; % flip that shit 
    % work with B, stops is accumulated
    b = mod(stop,numcards)+1;
    val  = mod(deck(b),13)+1;
    printcard(b, deck);
    switch val
        case 1
            endstops = endstops + 4;
            disp(['plus FOUR! ', num2str(endstops-stop), ' left']);
        case 11
            endstops = endstops + 1;
            disp(['plus ONE! ', num2str(endstops-stop), ' left']);
        case 12
            endstops = endstops + 2;
            disp(['plus TWO! ', num2str(endstops-stop), ' left']);
        case 13
            endstops = endstops + 3;
            disp(['plus THREE! ', num2str(endstops-stop), ' left']);
        otherwise
            disp(['phew! only ', num2str(endstops-stop), ' left']);
    end
    disp('-----------');
end

disp('BUS RIDE OVER!');
disp(['that took ', num2str(endstops), ' stops.']);




function printcard(b, deck)
    valname  = {'ACE','two','three','four','five','six','seven','eight','nine','ten','JACK','QUEEN','KING'};
    suitname = {'spades','hearts','clubs','diamonds'};
    val  = mod(deck(b),13)+1;
    suit = mod(deck(b),4)+1;
    disp([valname{val},' of ',suitname{suit}]);
end

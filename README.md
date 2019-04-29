# ridethebus

Wanted to model the last round of the "Ride the Bus" drinking game.

The author does not condone coerced or excessive drinking, but does like to have a good time. 

Basically, you lay out 10 cards, then flip over one by one. If an A/K/Q/J shows up, you add 4/3/2/1 cards to the stack, and none for any number card. 
One you reach the end, you drink proportional to the amount of turned cards. 

## Some results: 

Alowing the number of initial cards to vary is the primary independant variable in this exploration.

The maximum you can add is 40, so playing with more than 12 cards allows the possibility of hitting 52, triggering a shuffle and restart. 

The most common result for 8 initial cards is to add no cards.

The most common result for 9 initial cards is to add all possible cards. 

You can play with multiple decks in desired


## How to use:

.mats are results from some simulations.

.m's are scripts:

  ridethebus.m plays one game
  
  STATSridethebus.m plays many games for varying initial card number, and tells you how long they are, with some stats
  
  plothistoforbus.m will plot a histogram for each initial card number, seqentially
  
  ## License
[MIT](https://choosealicense.com/licenses/mit/)


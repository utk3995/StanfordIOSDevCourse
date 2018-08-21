//
//  CardMatchingGame.m
//  StanfordCardGame
//
//  Created by utkarsh.sri on 20/08/18.
//  Copyright © 2018 utkarsh.sri. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; // Array of cards
@property (nonatomic, strong) NSMutableArray *chosenCards;
@end

@implementation CardMatchingGame

- (NSMutableArray *) cards {
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

-(instancetype)initWithCardCount:(NSUInteger)count
                       usingDeck:(Deck *)deck {
    self = [super init];
    if (self) {
        for (int i=0;i< count;i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
    }
    self.gamemode = @"easy";
    [self resetChosenCards];
    return self;
}

- (Card *)cardAtIndex:(NSUInteger)index {
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

- (void) resetChosenCards {
    if (!_chosenCards) _chosenCards = [[NSMutableArray alloc] init];
    [self.chosenCards removeAllObjects];
}

static const int MISMATCH_PENALTY = 2;
static const int COST_TO_CHOOSE = 2;

- (void) chooseCardAtIndex:(NSUInteger)index {
    Card *card = [self cardAtIndex:index];
    if (card.chosen == YES)
        return;
    self.score -= COST_TO_CHOOSE;
    card.chosen = YES;
    int matchScore = -1;
    if ([self.gamemode isEqualToString:@"easy"] && [self.chosenCards count] == 1) {
        matchScore = [card match:_chosenCards];
    } else if ([self.gamemode isEqualToString:@"hard"] && [self.chosenCards count] == 2){
        matchScore = [card match:_chosenCards];
    }
    
    for (Card *ccard in _chosenCards) {
        NSLog(@"%@", ccard.contents);
    }
    NSLog(@"\n");
    NSLog(@"%@", [NSString stringWithFormat:@"Score : %d",matchScore]);
    
    if (matchScore > 0) {
        self.score += matchScore;
        card.matched = YES;
        for (Card *chosencard in _chosenCards)
            chosencard.matched = YES;
        [self resetChosenCards];
    } else if (matchScore == 0){
        self.score -= MISMATCH_PENALTY;
        for (Card *chosencard in _chosenCards)
            chosencard.chosen = NO;
        [self resetChosenCards];
        [self.chosenCards addObject:card];
    } else {
        [self.chosenCards addObject:card];
    }
}

@end


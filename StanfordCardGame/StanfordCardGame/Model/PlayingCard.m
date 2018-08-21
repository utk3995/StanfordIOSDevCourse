//
//  PlayingCard.m
//  StanfordCardGame
//
//  Created by utkarsh.sri on 20/08/18.
//  Copyright © 2018 utkarsh.sri. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

@synthesize suit = _suit; //because we are implementing both setter and getter

-(int)match:(NSArray *)otherCards {
    int score = 0;
    for (PlayingCard *otherCard in otherCards) {
        if ([self.suit isEqualToString:otherCard.suit])
            score += 10;
        else if (self.rank == otherCard.rank)
            score += 20;
    }
    return score;
}

- (NSString *)contents {
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

+ (NSArray *) validSuits {
    return @[@"♠",@"♥",@"♦",@"♣"];
}

+ (NSArray *) rankStrings {
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSUInteger ) maxRank {
    return [[PlayingCard rankStrings] count] -1;
}

- (void) setSuit:(NSString *)suit {
    if ([[PlayingCard validSuits] containsObject:suit])
        _suit = suit;
}

- (NSString *) suit {
    return _suit ? _suit : @"?";
}

@end

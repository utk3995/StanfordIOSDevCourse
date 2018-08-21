//
//  PlayingCard.h
//  StanfordCardGame
//
//  Created by utkarsh.sri on 20/08/18.
//  Copyright © 2018 utkarsh.sri. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *) validSuits;
+ (NSUInteger)maxRank;
+ (NSArray *) rankStrings;

@end

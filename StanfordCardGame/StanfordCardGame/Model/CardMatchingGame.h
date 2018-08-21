//
//  CardMatchingGame.h
//  StanfordCardGame
//
//  Created by utkarsh.sri on 20/08/18.
//  Copyright © 2018 utkarsh.sri. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

//designated initalizer
- (instancetype)initWithCardCount:(NSUInteger) count
                        usingDeck:(Deck *)deck;
- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic,readonly) NSInteger score;
@property (nonatomic,strong) NSString *gamemode;
@end

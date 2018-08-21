//
//  Deck.h
//  StanfordCardGame
//
//  Created by utkarsh.sri on 20/08/18.
//  Copyright © 2018 utkarsh.sri. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject
- (void) addCard:(Card *) card atTop:(BOOL)atTop;
- (Card *)drawRandomCard;
- (NSUInteger) currentSizeOfDeck;
@end

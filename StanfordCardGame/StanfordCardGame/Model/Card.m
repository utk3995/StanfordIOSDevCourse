//
//  Card.m
//  StanfordCardGame
//
//  Created by utkarsh.sri on 17/08/18.
//  Copyright © 2018 utkarsh.sri. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int) match:(NSArray *)otherCards {
    int score = 0;
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents])
            score++;
    }
    return score; 
}

@end

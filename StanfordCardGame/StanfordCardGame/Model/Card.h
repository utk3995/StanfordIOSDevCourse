//
//  Card.h
//  StanfordCardGame
//
//  Created by utkarsh.sri on 17/08/18.
//  Copyright © 2018 utkarsh.sri. All rights reserved.

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;

@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;

- (int)match:(NSArray *)card;


@end

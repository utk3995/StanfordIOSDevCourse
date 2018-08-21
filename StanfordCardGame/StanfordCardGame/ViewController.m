//
//  ViewController.m
//  StanfordCardGame
//
//  Created by utkarsh.sri on 17/08/18.
//  Copyright © 2018 utkarsh.sri. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCard.h"
#import "Deck.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"


@interface ViewController ()
@property (nonatomic, strong) Deck *deck;
@property (nonatomic, strong) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *gameModeController;
@end

@implementation ViewController

- (CardMatchingGame *)game {
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                          usingDeck:[self deck]];
    return _game;
}

- (Deck *) deck {
    if (!_deck)
        _deck = [[PlayingCardDeck alloc] init];
    return _deck;
}

- (IBAction)touchCoverCardButton:(UIButton *)sender {
    unsigned long cardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];
}

-(void) updateUI {
    for (UIButton *cardButton in self.cardButtons) {
        unsigned long cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score : %ld",(long)[self.game score]];
}

- (NSString *)titleForCard:(Card *)card {
    return card.isChosen ? card.contents : @"";
}

-(UIImage *)backgroundImageForCard:(Card *)card {
    return [UIImage imageNamed:card.isChosen ? @"border" : @"cover"];
}

- (IBAction)decodeButton:(id)sender {
    if (_gameModeController.selectedSegmentIndex == 0) {
        self.game.gamemode = @"easy";
    } else if(_gameModeController.selectedSegmentIndex == 1) {
        self.game.gamemode = @"hard";
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Kelv on 25/11/2013.
//  Copyright (c) 2013 Kelv. All rights reserved.
//

#import "CardGameViewController.h"
#import "Deck.h"
#import "PlayingCard.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()
//@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
//@property (nonatomic) int flipCount;
//@property (strong, nonatomic) Deck *deck;
@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@end

@implementation CardGameViewController

- (CardMatchingGame *)game
{
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    
    return _game;
}

//- (Deck *)deck
//{
//    if (!_deck) _deck = [[PlayingCardDeck alloc] init];
//    return _deck;
//}

- (Deck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
}

//-(void)setFlipCount:(int)flipCount {
//    _flipCount = flipCount;
//    self.flipsLabel.text = [NSString stringWithFormat: @"Flips: %d", self.flipCount];
//    NSLog(@"flipCount changed to %d", self.flipCount);
//}

- (IBAction)touchCardButton:(UIButton *)sender {

    int chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    
    [self updateUI];
    
//    self.flipCount++;
    
/*    PlayingCard *card = nil;
    
    if ([sender.currentTitle length]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"] forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    } else {

        card = (PlayingCard *)[self.deck drawRandomCard];

        if (card) {
            [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"] forState:UIControlStateNormal];
            [sender setTitle:card.contents forState:UIControlStateNormal];

            self.flipCount++;
        }
    }
*/

}

- (void)updateUI
{
    
    for (UIButton *cardButton in self.cardButtons) {
        int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    }
    
    
    
    
    
    
    
    
    
    
    
}

- (NSString *)titleForCard:(Card *)card
{
    return card.isChosen ? card.contents : @"";
}

- (UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}

@end

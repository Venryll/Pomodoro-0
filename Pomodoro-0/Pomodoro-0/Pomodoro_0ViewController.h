//
//  Pomodoro_0ViewController.h
//  Pomodoro-0
//
//  Created by Patrick Gasnier on 5/2/11.
//  Copyright 2011 G4 Comércio de Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Pomodoro_0ViewController : UIViewController 
{
    IBOutlet UILabel *textLabel, *sucesso;
    int minutos, segundos;
    
    BOOL running;
    
    NSTimer *time;
    
    IBOutlet UIButton *up, *down;
}

@property (nonatomic, retain)UILabel *textLabel, *sucesso;
@property (nonatomic)int segundos, minutos;
@property (nonatomic, retain) NSTimer *time;
@property (nonatomic, retain) UIButton *up, *down;
@property (nonatomic) BOOL running;

- (IBAction)startTimer:(id)sender;
- (IBAction)stopTimer:(id)sender;
- (void) resetTimer;
- (void) countSecond;
- (void) countMinute;
- (void)enableButtons;
- (void)disableButtons;

@end

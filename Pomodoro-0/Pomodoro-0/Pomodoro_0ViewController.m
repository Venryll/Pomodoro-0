//
//  Pomodoro_0ViewController.m
//  Pomodoro-0
//
//  Created by Patrick Gasnier on 5/2/11.
//  Copyright 2011 G4 Com√©rcio de Software. All rights reserved.
//

#import "Pomodoro_0ViewController.h"

@implementation Pomodoro_0ViewController

@synthesize textLabel, sucesso;
@synthesize segundos, minutos;
@synthesize time;
@synthesize up, down;
@synthesize running;

- (void)dealloc
{
    [textLabel release];
    [sucesso release];
    [up release];
    [down release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    segundos = 10;
    minutos = 0;
    running = NO;
    NSString *texto = [[NSString alloc] initWithFormat:@"%2d : %2d", self.minutos, self.segundos];
    
    [textLabel setText:texto];
    [texto release];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Interface Functions
- (IBAction)startTimer:(id)sender
{
    if(!running)
    {
        if(![sucesso isHidden])
        {
            [sucesso setHidden:YES];
        }
        
        [self disableButtons];
        
        time = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                target:self
                                               selector:@selector(countSecond)
                                               userInfo:nil 
                                                repeats:YES];
        running = YES;
    }
}

- (void)enableButtons
{
    [up setEnabled:YES];
    [down setEnabled:YES];    
}

- (void)disableButtons
{
    [up setEnabled:NO];
    [down setEnabled:NO];  
}

- (IBAction)stopTimer:(id)sender
{
    if(running)
    {
        [time invalidate];
        
        [self enableButtons];
        running = NO;
    }
    [self resetTimer];
    [sucesso setHidden:YES];
}

- (void) resetTimer
{
    segundos = 0;
    minutos = 25;
    
    NSString *texto = [[NSString alloc] initWithFormat:@"%2d : %2d", self.minutos, self.segundos];
    
    [textLabel setText:texto];
    [texto release];
}

- (void) countSecond
{
    if(minutos == 0)
    {
        if(segundos != 0)
        {
            segundos--;
        }
        else
        {
            [time invalidate];
            NSString *texto = [[NSString alloc] initWithFormat:@"Sucesso!"];
            [sucesso setText:texto];
            [sucesso setHidden:NO];
            [texto release];
            [self resetTimer];
            running = NO;
        }
    }
    else
    {
        if(segundos == 0)
        {
            segundos = 59;
            [self countMinute];
        }
        else
        {
            segundos--;
        }
    }
    
    NSString *texto = [[NSString alloc] initWithFormat:@"%2d : %2d", self.minutos, self.segundos];
    
    [textLabel setText:texto];
    [texto release];
}

- (void) countMinute
{
    minutos--;
}

- (IBAction) oneMore:(id)sender
{
    if(minutos < 59)
    {
        minutos++;
        
        NSString *texto = [[NSString alloc] initWithFormat:@"%2d : %2d", self.minutos, self.segundos];
        
        [textLabel setText:texto];
        [texto release];
    }
    else
    {
        NSString *texto = [[NSString alloc] initWithFormat:@"Não pode!"];
        [sucesso setText:texto];
        [sucesso setHidden:NO];
        [texto release];
    }
}

- (IBAction) OneLess:(id)sender
{
    if(minutos > 0)
    {
        minutos--;
        
        NSString *texto = [[NSString alloc] initWithFormat:@"%2d : %2d", self.minutos, self.segundos];
        
        [textLabel setText:texto];
        [texto release];
    }
    else
    {
        NSString *texto = [[NSString alloc] initWithFormat:@"Não pode!"];
        [sucesso setText:texto];
        [sucesso setHidden:NO];
        [texto release];
    }
}

@end

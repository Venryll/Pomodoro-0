//
//  Pomodoro_0AppDelegate.h
//  Pomodoro-0
//
//  Created by Patrick Gasnier on 5/2/11.
//  Copyright 2011 G4 Comércio de Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Pomodoro_0ViewController;

@interface Pomodoro_0AppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet Pomodoro_0ViewController *viewController;

@end

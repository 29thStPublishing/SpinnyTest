//
//  SpinnyTestAppDelegate.h
//  SpinnyTest
//
//  Created by nataliepo on 5/13/11.
//  Copyright 2011 Auburn & Ivory. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SpinnyTestViewController;

@interface SpinnyTestAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet SpinnyTestViewController *viewController;

@end

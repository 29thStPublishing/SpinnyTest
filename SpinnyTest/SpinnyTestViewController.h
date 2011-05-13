//
//  SpinnyTestViewController.h
//  SpinnyTest
//
//  Created by nataliepo on 5/13/11.
//  Copyright 2011 Auburn & Ivory. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpinnyTestViewController : UIViewController {
    IBOutlet UIButton *startStopButton;
    IBOutlet UIButton *pictureButton;
    
    IBOutlet UILabel * countdown;
    
    IBOutlet UIActivityIndicatorView * spinny;
}

@property (nonatomic, retain) UIActivityIndicatorView * spinny;
@property (nonatomic, retain) UIButton * startStopButton;
@property (nonatomic, retain) UIButton * pictureButton;

@property (nonatomic, retain) UILabel * countdown;

-(IBAction)startStopButtonTouched: (id) sender;

-(IBAction)pictureButtonTouched: (id) sender;


-(void)startSpinning:(id) sender;  
-(void)stopSpinning:(id) sender;
-(void) startCountdown:(id) sender;


@end

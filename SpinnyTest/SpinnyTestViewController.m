//
//  SpinnyTestViewController.m
//  SpinnyTest
//
//  Created by nataliepo on 5/13/11.
//  Copyright 2011 Auburn & Ivory. All rights reserved.
//

#import "SpinnyTestViewController.h"

#define COUNTDOWN_TIME 3


@implementation SpinnyTestViewController


@synthesize spinny, startStopButton, pictureButton;
@synthesize countdown;


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
    
//    [spinny startAnimating];
    spinny.hidesWhenStopped = TRUE;
    [spinny stopAnimating];
    
    NSLog(@"[VC::viewDidLoad]\n");
}

-(void) viewWillAppear:(BOOL)animated {
    NSLog(@"[VC::viewWillAppear]\n");
    
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
    return YES;
}

- (void)dealloc
{
    [countdown release];
    [spinny release];
    [startStopButton release];
    [pictureButton release];
    
    [super dealloc];
}

-(void)startSpinning:(id) sender {     
    
    // turn off the button, too, to avoid resetting the clock.
    startStopButton.enabled = NO;

    [spinny startAnimating]; 
}


-(void)stopSpinning:(id) sender {
    [spinny stopAnimating];
    
    startStopButton.enabled = YES;

}


// this is where your costly operations would happen.
-(void) startCountdown:(id) sender {
    int value = COUNTDOWN_TIME;
    
    while (value >= 0) {
        //countdown.text = [NSString stringWithFormat:@"%d", value];
        [countdown setText: [NSString stringWithFormat:@"%d", value]];

        // sleep for 1 sec
        [NSThread sleepForTimeInterval:1.0];
        
        NSLog(@"[startCountdown] VALUE: %d\n", value);
        
        value--;
    }
    
}

-(IBAction)startStopButtonTouched: (id) sender {
    NSLog(@"[vC::startStopButtonTouched]\n");
    
    //startStopButton.titleLabel = @"Stop";
    
    

    
    /***
     * NOTE
     ***
     The following WILL NOT WORK.
     ***
     
    if ([spinny isAnimating]) {
        [spinny stopAnimating];
    }
    else {
        [spinny startAnimating];
     
        // Do Something That Takes A While.
    }
    ***
    * You have to make the startAnimating action a separate (quick!) thread,
    * like this:
    ***/
    
    
    [NSThread detachNewThreadSelector:@selector(startSpinning:) toTarget:self withObject:nil];
    
    
    // THIS HAS TO HAPPEN ON THE MAIN THREAD.
    [self startCountdown:nil];
        
    [self stopSpinning:nil];
    

}

-(IBAction)pictureButtonTouched: (id) sender {
    NSLog(@"[VC::pictureButtonTouched]\n");
}

@end

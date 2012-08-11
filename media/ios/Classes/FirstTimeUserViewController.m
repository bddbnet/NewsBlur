//
//  FirstTimeUserViewController.m
//  NewsBlur
//
//  Created by Roy Yang on 6/13/12.
//  Copyright (c) 2012 NewsBlur. All rights reserved.
//

#import "FirstTimeUserViewController.h"
#import "NewsBlurAppDelegate.h"
#import "ASIHTTPRequest.h"
#import "FirstTimeUserAddSitesViewController.h"

#define WELCOME_BUTTON_TITLE @"LET'S GET STARTED"
#define ADD_SITES_SKIP_BUTTON_TITLE @"SKIP THIS STEP"
#define ADD_SITES_BUTTON_TITLE @"NEXT"
#define ADD_FRIENDS_BUTTON_TITLE @"SKIP THIS STEP"
#define ADD_NEWSBLUR_BUTTON_TITLE @"FINISH"

@interface FirstTimeUserViewController ()

@property (readwrite) float angle_;

@end

@implementation FirstTimeUserViewController

@synthesize appDelegate;
@synthesize nextButton;
@synthesize logo;
@synthesize angle_;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.


    UIBarButtonItem *next = [[UIBarButtonItem alloc] initWithTitle:@"Let's get started" style:UIBarButtonSystemItemDone target:self action:@selector(tapNextButton)];
    self.nextButton = next;
    self.navigationItem.rightBarButtonItem = next;
    
    self.navigationItem.title = @"Step 1 of 4";

}

- (void)viewDidUnload
{
    [self setNextButton:nil];
    [self setLogo:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated {
    [self rotateLogo];
}

- (void)viewDidAppear:(BOOL)animated {

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}


- (IBAction)tapNextButton {
    [appDelegate.ftuxNavigationController pushViewController:appDelegate.firstTimeUserAddSitesViewController animated:YES];
    
}

- (void)rotateLogo {
    angle_ = 0;
    [UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDuration:1];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
	
	[NSTimer scheduledTimerWithTimeInterval: 0.016666 target: self selector:@selector(hadleTimer:) userInfo: nil repeats: YES];
	[UIView commitAnimations];

}

-(void)hadleTimer:(NSTimer *)timer
{
	angle_ += 0.001;
	if (angle_ > 6.283) { 
		angle_ = 0;
	}
	
	CGAffineTransform transform=CGAffineTransformMakeRotation(angle_);
	self.logo.transform = transform;
}


@end

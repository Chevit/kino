//
//  ViewController.m
//  Search
//
//  Created by Vitaliy Cherepakha on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "PlaceViewController.h"
#import "FilterViewController.h"
#import "DepartmentViewController.h"
@interface ViewController ()

@end

@implementation ViewController
@synthesize splitView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(piu) name:@"closePopover" object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(search) name:@"search" object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(asdasd) name:@"closeDetails" object:nil];
	self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background-pattern.png"]];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showMore:) name:@"piu" object:nil];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)asdasd
{
	[depVC.view removeFromSuperview];
	depVC = nil;
}

- (void)search
{
	[pc dismissPopoverAnimated:YES];
}

- (void)piu
{
	[pc dismissPopoverAnimated:YES];
}

- (void)viewDidUnload
{
	[[NSNotificationCenter defaultCenter] removeObserver:self];
	[self setSplitView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (IBAction)placeButtonTouched:(UIButton*)sender
{
	
	PlaceViewController *contentViewController = [[PlaceViewController alloc] initWithNibName:nil bundle:nil];
	
	
	pc = [[UIPopoverController alloc] initWithContentViewController:contentViewController];
	[pc presentPopoverFromRect:sender.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
	pc.delegate = self;
	
	
	
}


- (IBAction)filterButtonTouched:(UIButton*)sender
{
	FilterViewController *contentViewController = [[FilterViewController alloc] initWithNibName:nil bundle:nil];
	
	pc = [[UIPopoverController alloc] initWithContentViewController:contentViewController];
	[pc presentPopoverFromRect:sender.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
	pc.delegate = self;
	
	
}

- (void)showMore:(NSNotification*)notif
{
	[pc dismissPopoverAnimated:YES];	

	
	depVC = [[DepartmentViewController alloc] initWithNibName:@"DepartmrntViewController" bundle:nil];

	CGRect rect = [[UIScreen mainScreen] bounds];
	UIDeviceOrientation asd  = [[UIDevice currentDevice] orientation];
	
	CGFloat max = MAX(rect.size.width, rect.size.height);
	CGFloat min = MIN(rect.size.width, rect.size.height);
	
	depVC.view.frame = CGRectMake(0, 100, UIInterfaceOrientationIsLandscape(asd)?max:min, (UIInterfaceOrientationIsLandscape(asd)?min:max) - 120);
	[self.view addSubview:depVC.view];
	
}

@end

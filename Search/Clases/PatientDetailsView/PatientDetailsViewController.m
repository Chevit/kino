//
//  PatientDetailsViewController.m
//  Search
//
//  Created by Gennadij on 8/14/12.
//
//

#import "PatientDetailsViewController.h"

@interface PatientDetailsViewController ()

@end

@implementation PatientDetailsViewController
@synthesize textView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
//		[self view];
//		self.textView.numberOfLines = 0;
        self.modalPresentationStyle = UIModalPresentationFormSheet;
    }
    return self;
}
- (void)piu
{
//	[textView sizeToFit];
//	textView.frame = CGRectMake(textView.frame.origin.x, textView.frame.origin.y, <#CGFloat width#>, <#CGFloat height#>) ;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setTextView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)backButtonTouched:(id)sender
{
	[self dismissModalViewControllerAnimated:YES];
}
@end

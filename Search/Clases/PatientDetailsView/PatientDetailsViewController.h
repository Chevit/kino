//
//  PatientDetailsViewController.h
//  Search
//
//  Created by Gennadij on 8/14/12.
//
//

#import <UIKit/UIKit.h>

@interface PatientDetailsViewController : UIViewController
- (IBAction)backButtonTouched:(id)sender;
@property (unsafe_unretained, nonatomic) IBOutlet UITextView *textView;
- (void)piu;
@end

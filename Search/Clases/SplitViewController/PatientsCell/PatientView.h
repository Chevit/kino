//
//  PatientView.h
//  Search
//
//  Created by Gennadij on 8/6/12.
//
//

#import <UIKit/UIKit.h>

@interface PatientView : UITableViewCell
@property (unsafe_unretained, nonatomic) IBOutlet UITextView *nameLAbel;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *dateLabel;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
- (void)initializeWithParams:(NSDictionary*)dict;
@end

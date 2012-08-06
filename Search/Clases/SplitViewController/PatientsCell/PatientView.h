//
//  PatientView.h
//  Search
//
//  Created by Gennadij on 8/6/12.
//
//

#import <UIKit/UIKit.h>

@interface PatientView : UITableViewCell
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *nameLAbel;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *birthLabel;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *incom;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *outcom;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *diagnos;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
- (void)initializeWithParams:(NSDictionary*)dict;
@end

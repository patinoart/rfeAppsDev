//
//  rfeSessionDetailViewController.h
//  RfeOfJATest
//
//  Created by Juan Patino on 4/14/13.
//
//

#import <UIKit/UIKit.h>

@class rfeSession;

@interface rfeSessionDetailViewController : UITableViewController

// adding the session data to collect

// bodyPart:

//    Shoulder L  (Arms)
//    Shoulder R
//    Elbow L
//    Elbow R
//    Wrist L
//    Wrist R
//    Hip L       (Legs)
//    Hip R
//    Knee L
//    Knee R
//    Ankle L
//    Ankle R
//    Lower Back  (Lumbar)
//    Upper Back  (Thoracic)
//    Neck        (Cervical)

// Before :: After - NSRange 0 - 10

// Intensity - LOW, MED, HIGH (2,4,6 Capacitors)

// Frequency - Delta - 4Hz  - LOW
//           - Tesla - 7Hz  - MED
//           - EMF   - 23Hz - HIGH

// Date (date of session, usually today's date)

@property (strong, nonatomic) rfeSession *session;

@property (strong, nonatomic) IBOutlet UILabel *bodyPartNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *beforeSessionLabel;
@property (strong, nonatomic) IBOutlet UILabel *afterSessionLabel;
@property (strong, nonatomic) IBOutlet UILabel *intensityLabel;
@property (strong, nonatomic) IBOutlet UILabel *frequencyLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;

@end

//
//  rfeSession.h
//  RfeOfJATest
//
//  Created by Juan Patino on 4/14/13.
//
//

#import <Foundation/Foundation.h>

@interface rfeSession : NSObject

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

@property (nonatomic, copy) NSArray *bodyPart;
@property int beforeSession;
@property (nonatomic, copy) NSArray *intensity;
@property (nonatomic, copy) NSArray *frequency;
@property (nonatomic, copy) NSDate *date;
@property int afterSession;

// init property

- (id)initWithBodyPart:(NSArray *)bodyPart beforeSession:(int)beforeSession intensity:(NSArray *)intensity frequency:(NSArray *)frequency date:(NSDate *)date afterSession:(int)afterSession;












@end

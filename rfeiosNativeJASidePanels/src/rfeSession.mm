//
//  rfeSession.m
//  RfeOfJATest
//
//  Created by Juan Patino on 4/14/13.
//
//

#import "rfeSession.h"

@implementation rfeSession

-(id)initWithBodyPart:(NSArray *)bodyPart beforeSession:(int)beforeSession intensity:(NSArray *)intensity frequency:(NSArray *)frequency date:(NSDate *)date afterSession:(int)afterSession {
    
    // init implementation for the data set
    self = [super init];
    if (self) {
        _bodyPart = bodyPart;
        _beforeSession = beforeSession;
        _intensity = intensity;
        _frequency = frequency;
        _date = date;
        _afterSession = afterSession;
    }
    return nil;
    
}

@end

//
//  rfeSessionDataController.m
//  RfeOfJATest
//
//  Created by Juan Patino on 4/14/13.
//
//

#import "rfeSessionDataController.h"
#import "rfeSession.h"

@interface rfeSessionDataController ()

// declaring list creation method by adding code below
// class extension - private to the class
- (void)initializeDefaultDataList;

@end

@implementation rfeSessionDataController

// implement list creation method
// this is the default list
- (void)initializeDefaultDataList {
    
    NSMutableArray *sessionList = [[NSMutableArray alloc] init];
    self.masterRfeSessionList = sessionList;
    rfeSession *session;
    NSDate *today = [NSDate date];
    NSArray *bodyParts = [NSArray arrayWithObjects:@"Left Shoulder", @"Right Shoulder", @"Left Elbow", @"Right Elbow", @"Left Wrist", @"Right Wrist", @"Left Hip", @"Right Hip", @"Left Knee", @"Right Knee", @"Left Ankle", @"Right Ankle", @"Lower Back", @"Upper Back", @"Neck", nil];
    NSArray *intensities = [NSArray arrayWithObjects:@"LOW", @"MED", @"HIGH", nil];
    NSArray *frequencies = [NSArray arrayWithObjects:@"LOW", @"MED", @"HIGH", nil];
    
    session = [[rfeSession alloc] initWithBodyPart:bodyParts beforeSession:10 intensity:intensities frequency:frequencies date:today afterSession:5];
    [self addRfeSessionWithSession:session];
    
}

// to implement a custom setter for the master list property
-(void)setMasterRfeSessionList:(NSMutableArray *)newList {
    
    if (_masterRfeSessionList != newList) {
        _masterRfeSessionList = [newList mutableCopy];
    }
    
}

// initialize the data controller object
-(id)init {
    
    if (self = [super init]) {
        [self initializeDefaultDataList];
        return self;
    }
    return nil;
    
}

// implement data controller's data-access methods
- (NSUInteger)countOfList {
    return [self.masterRfeSessionList count];
}

- (rfeSession *)objectInListAtIndex:(NSUInteger)theIndex {
    return [self.masterRfeSessionList objectAtIndex:theIndex];
}

- (void)addRfeSessionWithSession:(rfeSession *)session {
    [self.masterRfeSessionList addObject:session];
}

@end

//
//  rfeSessionDataController.h
//  RfeOfJATest
//
//  Created by Juan Patino on 4/14/13.
//
//

#import <Foundation/Foundation.h>

@class rfeSession;

@interface rfeSessionDataController : NSObject

@property (nonatomic, copy) NSMutableArray *masterRfeSessionList;

- (NSUInteger)countOfList;
- (rfeSession *)objectInListAtIndex:(NSUInteger)theIndex;
- (void)addRfeSessionWithSession:(rfeSession *)session;

@end

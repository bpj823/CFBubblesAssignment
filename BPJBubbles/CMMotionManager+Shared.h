//
//  CMMotionManager+Shared.h
//  BPJBubbles
//
//  Created by Brad on 9/12/13.
//  Copyright (c) 2013 Brad. All rights reserved.
//

#import <CoreMotion/CoreMotion.h>

@interface CMMotionManager (Shared)

+ (CMMotionManager *)sharedMotionManager;


@end

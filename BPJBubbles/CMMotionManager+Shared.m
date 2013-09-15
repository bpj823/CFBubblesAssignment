//
//  CMMotionManager+Shared.m
//  BPJBubbles
//
//  Created by Brad on 9/12/13.
//  Copyright (c) 2013 Brad. All rights reserved.
//

#import "CMMotionManager+Shared.h"

@implementation CMMotionManager (Shared)

+(CMMotionManager *)sharedMotionManager
{
    static CMMotionManager *shared = nil;
    if (!shared)
    {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            
            shared = [[CMMotionManager alloc]init];
            
        });
        
    }
    
    return shared;
    
}

@end

//
//  CCAnimationHelper.h
//  ShutEmUp
//
//  Created by Cyril Savitsky on 7/16/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface CCAnimation (Helper)

+ (CCAnimation*) createAnimationWithFile:(NSString*)name 
                                frameCount:(int)frameCount delay:(float)delay;
+ (CCAnimation*) createAnimationWithFrames:(NSString*)name 
                                frameCount:(int)frameCount delay:(float)delay;

@end

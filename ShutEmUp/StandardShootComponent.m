//
//  StandardShootComponent.m
//  ShutEmUp
//
//  Created by Cyril Savitsky on 7/20/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "StandardShootComponent.h"

@implementation StandardShootComponent

@synthesize shootFrequency;
@synthesize bulletFrameName;

- (id) init {
    if (( self = [super init] )) {
        [self scheduleUpdate];
    }
    return self;
}

- (void) update:(ccTime)delta {
    if (self.parent.visible) {
        updateCount += delta;
        if (updateCount >= shootFrequency) {
            updateCount = 0;
            GameScene *game = [GameScene sharedGameScene];
            CGPoint startPos = ccpSub(self.parent.position, CGPointMake(self.parent.contentSize.width * 0.5f, 0));
            [game.getBulletCache shootBullet:startPos velocity:CGPointMake(-200, 0) frameName:bulletFrameName];
        }
    }
}

- (void) dealloc {
    [bulletFrameName release];
    [super dealloc];
}

@end

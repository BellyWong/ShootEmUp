//
//  StandardMoveComponent.m
//  ShutEmUp
//
//  Created by Cyril Savitsky on 7/20/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "StandardMoveComponent.h"


@implementation StandardMoveComponent

- (id) init {
    if ((self = [super init] )) {
        velocity = CGPointMake(-100, 0);
		[self scheduleUpdate];
    }
    return self;
}

- (void) update:(ccTime)delta {
    if (self.parent.visible) {
        NSAssert([self.parent isKindOfClass:[Entity class]], @"it's not an Entity class");
        
        Entity *entity = (Entity*) self.parent;
        if (entity.position.x > [GameScene screenRect].size.width * 0.5f) {
            [entity setPosition:ccpAdd(entity.position, ccpMult(velocity,delta))];
        }
    }
}

@end

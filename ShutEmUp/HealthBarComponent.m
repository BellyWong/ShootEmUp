//
//  HealthBarComponent.m
//  ShutEmUp
//
//  Created by Cyril Savitsky on 7/21/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "HealthBarComponent.h"


@implementation HealthBarComponent

- (id) init {
    if ((self = [super init])) {
        self.visible = NO;
        [self scheduleUpdate];
    }
    return self;
}

- (void) reset {
    float parentHeight = self.parent.contentSize.height;
    float selfHeight = self.contentSize.height;
    self.position = CGPointMake(self.parent.anchorPointInPoints.x, parentHeight + selfHeight);
    self.scaleX = 1;
    self.visible = YES;
}

- (void) update:(ccTime)delta {
    if (self.parent.visible) {
        NSAssert([self.parent isKindOfClass:[EnemyEntity class]],@"health bar problem");
        EnemyEntity *parentEntity = (EnemyEntity*)self.parent;
        self.scaleX = parentEntity.hitPoints / (float)parentEntity.initialHitPoints;
    } else if (self.visible)
        self.visible = NO;
                            
}

@end

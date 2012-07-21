//
//  BattleShip.m
//  ShutEmUp
//
//  Created by Cyril Savitsky on 7/16/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "BattleShip.h"
#import "CCAnimationHelper.h"

@implementation BattleShip

+ (id) initShip {
    return [[[self alloc] initWithShipImage] autorelease];
}

- (id) initWithShipImage {
    
    if ((self = [super initWithSpriteFrameName:@"ship.png"])) {
        CCAnimation *anim = [CCAnimation createAnimationWithFrames:@"ship-anim" frameCount:5 delay:0.08f];
        
        CCAnimate *animate = [CCAnimate actionWithAnimation:anim];
        CCRepeatForever *repeat = [CCRepeatForever actionWithAction:animate];
        
        [self runAction:repeat];
        
        [self scheduleUpdate];
    }
    return self;
}

- (void) update:(ccTime)delta {
    //[[GameScene sharedGameScene] shootWithShip:self];
}

@end

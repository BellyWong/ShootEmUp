//
//  Bullet.m
//  ShutEmUp
//
//  Created by Cyril Savitsky on 7/16/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Bullet.h"


@implementation Bullet

@synthesize velocity;
@synthesize isPlayerBullet;
static CGRect screenRect;


+ (id) initBullet {
    return [[[self alloc] initBulletWithImage] autorelease];
    
}

- (id) initBulletWithImage {
    if (( self = [super initWithSpriteFrameName:@"bullet.png"])) {
        if(CGRectIsEmpty(screenRect)) {
            CGSize screenSize = [[CCDirector sharedDirector] winSize];
            screenRect = CGRectMake(0, 0, screenSize.width, screenSize.height); 
        }
    }
    return self;
}

- (void) shootBullet:(CGPoint)startPosition velocity:(CGPoint)vel frameName:(NSString *)frameName {
    self.visible = YES;
    self.velocity = vel;
    self.position = startPosition;
    
    //wtf is that?????
    if (frameName == @"bullet.png")
        isPlayerBullet = YES;
    else isPlayerBullet = NO;
    CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:frameName];
    [self setDisplayFrame:frame];
    
    [self unscheduleUpdate];
    [self scheduleUpdate];

}

- (void) update:(ccTime)delta {
    self.position = ccpAdd(self.position, ccpMult(velocity, delta));
    if (CGRectIntersectsRect([self boundingBox], screenRect) == NO) {
        self.visible = NO;
        [self unscheduleUpdate];
    }
}

@end

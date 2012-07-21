//
//  BulletCache.m
//  ShutEmUp
//
//  Created by Cyril Savitsky on 7/20/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "BulletCache.h"


@implementation BulletCache

- (id) init {
    if (( self = [super init] )) {
        CCSpriteFrame *bulletFrame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"bullet.png"];
        batch = [CCSpriteBatchNode batchNodeWithTexture:bulletFrame.texture];
        [self addChild:batch];
    

    
        for (int i = 0; i < 200; i++) {
            Bullet *bullet = [Bullet initBullet];
            bullet.visible = NO;
            [batch addChild:bullet];
        }
    }
    return self;
}

- (void) shootBullet:(CGPoint)startPosition velocity:(CGPoint)velocity frameName:(NSString *)frameName {
    
    CCArray *bullets = [batch children];
    CCLOG(@"%i",[bullets count] );
    CCNode *node = [bullets objectAtIndex:nextActiveBullet];
    NSAssert([node isKindOfClass:[Bullet class]],@"it's not a bullet!");
    Bullet *bullet = (Bullet*) node;
    [bullet shootBullet:startPosition velocity:velocity frameName:frameName];
    
    
    nextActiveBullet++;
    if (nextActiveBullet == 200)
        nextActiveBullet = 0;
}

-(void) dealloc
{
	[super dealloc];
}

-(bool) isPlayerBulletCollidingWithRect:(CGRect)rect
{
	return [self isBulletCollidingWithRect:rect usePlayerBullets:YES];
}

-(bool) isEnemyBulletCollidingWithRect:(CGRect)rect
{
	return [self isBulletCollidingWithRect:rect usePlayerBullets:NO];
}

- (bool) isBulletCollidingWithRect:(CGRect)rect usePlayerBullets:(bool)usePlayerBullets {
    bool isColliding = NO;
    
    Bullet *bullet;
    CCARRAY_FOREACH([batch children], bullet) {
        bool q = bullet.isPlayerBullet;
        if (bullet.visible == YES && usePlayerBullets == bullet.isPlayerBullet) {
            if (CGRectIntersectsRect([bullet boundingBox], rect)) {
                isColliding = YES;
                
                bullet.visible = NO;
                break;
            }
        }
    }
    return isColliding;
}

@end

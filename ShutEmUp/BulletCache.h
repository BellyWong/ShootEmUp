//
//  BulletCache.h
//  ShutEmUp
//
//  Created by Cyril Savitsky on 7/20/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Bullet.h"

@interface BulletCache : CCNode {
    CCSpriteBatchNode *batch;
    int nextActiveBullet;
}

- (void) shootBullet:(CGPoint)startPosition velocity:(CGPoint)velocity frameName:(NSString*)frameName;
-(bool) isPlayerBulletCollidingWithRect:(CGRect)rect;
-(bool) isEnemyBulletCollidingWithRect:(CGRect)rect;
-(bool) isBulletCollidingWithRect:(CGRect)rect usePlayerBullets:(bool)usePlayerBullets;
@end

//
//  Bullet.h
//  ShutEmUp
//
//  Created by Cyril Savitsky on 7/16/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "BattleShip.h"

@class BattleShip;

@interface Bullet : CCSprite {
    CGPoint velocity;
    float outSideScreen;
    bool isPlayerBullet;
}

@property (readwrite,nonatomic) CGPoint velocity;
@property (readwrite, nonatomic) bool isPlayerBullet;

+ (id) initBullet;
- (id) initBulletWithImage;
- (void) shootWithShip:(BattleShip*)ship;
- (void) shootBullet:(CGPoint)startPosition velocity:(CGPoint)velocity frameName:(NSString *)frameName;

@end

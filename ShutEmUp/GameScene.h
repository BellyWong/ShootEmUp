//
//  GameScene.h
//  ShutEmUp
//
//  Created by Cyril Savitsky on 7/16/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "BattleShip.h"
#import "Bullet.h"
#import "ParallaxBackground.h"
#import "InputLayer.h"
#import "BulletCache.h"
#import "EnemyCache.h"

@class BattleShip;
@class BulletCache;

typedef enum {
    GameSceneBulletTag = 1,
    GameSceneBulletBatchTag,
    GameSceneLayerTagGame,
    GameSceneLayerTagInput,
    GameSceneShipTag,
    GameSceneBulletCache,
    GameSceneNodeTagEnemyCache,
} GameSceneTags;

@interface GameScene : CCLayer {

}

+ (id) scene;
//- (BattleShip*) defaultShip;
+ (GameScene *) sharedGameScene;
//- (BulletCache*) getBulletCache;
- (CCSpriteBatchNode*) spriteBatchNode;
- (void) shootWithShip:(BattleShip*)ship;
+ (CGRect) screenRect;
- (void) preloadParticleEffect:(NSString*) effect;

@property(readonly, nonatomic) BattleShip* defaultShip;
@property(readonly, nonatomic) BulletCache* getBulletCache;


@end

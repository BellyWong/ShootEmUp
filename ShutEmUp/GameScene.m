//
//  GameScene.m
//  ShutEmUp
//
//  Created by Cyril Savitsky on 7/16/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "GameScene.h"


@implementation GameScene

static GameScene *instanceOfGameScene;
static CGRect screenRect;

+ (CGRect) screenRect {
    return screenRect;
}

+ (GameScene*) sharedGameScene {
    NSAssert(instanceOfGameScene != nil, @"Instance of game scene not yet initialized");
    return  instanceOfGameScene;
}

- (BattleShip*) defaultShip {
    CCNode *node = [self getChildByTag:GameSceneShipTag];
    NSAssert([node isKindOfClass:[BattleShip class]],@"smt wrong with battleship class");
    return (BattleShip*) node;
}

+ (id) scene {
    CCScene *scene = [CCScene node];
    GameScene *layer = [GameScene node];
    [scene addChild:layer];
    InputLayer *input = [InputLayer node];
    [scene addChild:input];
    return scene;
}

- (id) init {
    
    if ( (self = [super init]) ) {
        instanceOfGameScene = self;
        CCSpriteFrameCache *frameCache = [CCSpriteFrameCache sharedSpriteFrameCache];
        [frameCache addSpriteFramesWithFile:@"game-art.plist"];
        CGSize size = [[CCDirector sharedDirector] winSize];
        screenRect = CGRectMake(0, 0, size.width, size.height);
        
        ParallaxBackground *background = [ParallaxBackground node];
        [self addChild:background];
        
        BattleShip *ship = [BattleShip initShip];
        ship.position = CGPointMake(80, size.height/2);
        [self addChild:ship z:10 tag:GameSceneShipTag];
        
        BulletCache *bulletCache = [BulletCache node];
        [self addChild:bulletCache z:1 tag:GameSceneBulletCache];
               
		EnemyCache* enemyCache = [EnemyCache node];
		[self addChild:enemyCache z:0 tag:GameSceneNodeTagEnemyCache];
        
        [self preloadParticleEffect:@"fx-explosion.plist"];
        [self preloadParticleEffect:@"fx-explosion2.plist"];        
        
        [[SimpleAudioEngine sharedEngine] preloadEffect:@"explo1.wav"];
		[[SimpleAudioEngine sharedEngine] preloadEffect:@"explo2.wav"];
		[[SimpleAudioEngine sharedEngine] preloadEffect:@"shoot1.wav"];
		[[SimpleAudioEngine sharedEngine] preloadEffect:@"shoot2.wav"];
		[[SimpleAudioEngine sharedEngine] preloadEffect:@"hit1.wav"];
        
    }
    return self;
}

- (void) preloadParticleEffect:(NSString*) effect {
    [CCParticleSystemQuad particleWithFile:effect];
}

- (BulletCache*) getBulletCache {
    CCNode *node = [self getChildByTag:GameSceneBulletCache];
    //BulletCache *cache = (BulletCache*) node;
    NSAssert([node isKindOfClass:[BulletCache class]],@"It's not a bulletCache class");
    return (BulletCache*) node;
}

- (void) dealloc {
    [super dealloc];
}

@end

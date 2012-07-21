//
//  EnemyCache.m
//  ShutEmUp
//
//  Created by Cyril Savitsky on 7/20/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "EnemyCache.h"


@implementation EnemyCache

- (id) init {
    if (( self = [super init] )) {
        CCSpriteFrame *bulletFrame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"bullet.png"];
        batch = [CCSpriteBatchNode batchNodeWithTexture:bulletFrame.texture];
        [self addChild:batch];
        [self initEnemies];
        [self scheduleUpdate];
    }
    return self;
}

- (void) spawnEnemyOfType:(EnemyTypes)enemyType {
    CCArray *enemiesOfType = [enemies objectAtIndex:enemyType];
    EnemyEntity *enemy;
    CCARRAY_FOREACH(enemiesOfType, enemy) {
        if (enemy.visible == NO) {
            CCLOG(@"spawn enemy type %i", enemyType);
            [enemy spawn];
            break;
        }
    }
}

- (void) initEnemies {
    enemies = [[CCArray alloc] initWithCapacity:EnemyTypeMAX];
    for (int i = 0; i < EnemyTypeMAX; i++) {
        int capacity;
        switch(i) {
            case EnemyTypeUfo:
                capacity = 6;
                break;
            case EnemyTypeCruiser:
                capacity = 3;
                break;
            case EnemyTypeBoss:
                capacity = 1;
                break;
            
            default:
                [NSException exceptionWithName:@"EnemyCache exception" reason:@"unhandled enemy type" userInfo:nil];
                break;
        }
        CCArray *enemiesOfType = [CCArray arrayWithCapacity:capacity];
        [enemies addObject:enemiesOfType];
    }
    for (int i = 0; i < EnemyTypeMAX; i++) {
        CCArray *enemiesOfType = [enemies objectAtIndex:i];
        int numEnemiesOfType = [enemiesOfType capacity];
        
        for (int j = 0; j < numEnemiesOfType; j++) {
            EnemyEntity *enemy = [EnemyEntity enemyWithType:i];
            [batch addChild:enemy z:0 tag:i];
            [enemiesOfType addObject:enemy];
        }
    }
}

- (void) update:(ccTime) delta {
    updateCount++;
    
    for (int i = EnemyTypeMAX - 1; i >= 0; i--) {
        int spawnFrequency = [EnemyEntity getSpawnFrequencyForEnemyType:i];
        if (updateCount % spawnFrequency == 0) {
            [self spawnEnemyOfType:i];
            break;
        }
        [self checkForBulletCollisions];
    }
}

- (void) dealloc {
    [enemies release];
    [super dealloc];
}

- (void) checkForBulletCollisions {
    EnemyEntity *enemy;
    CCARRAY_FOREACH([batch children], enemy) {
        if (enemy.visible) {
            BulletCache *bulletCache = [[GameScene sharedGameScene] getBulletCache];
            CGRect bbox = [enemy boundingBox];
            if ([bulletCache isPlayerBulletCollidingWithRect:bbox]) {
                [enemy gotHit];
            }
        }
    }
}

@end

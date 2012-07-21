//
//  EnemyCache.h
//  ShutEmUp
//
//  Created by Cyril Savitsky on 7/20/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "EnemyEntity.h"

@interface EnemyCache : CCNode {
    CCSpriteBatchNode *batch;
    CCArray *enemies;
    
    int updateCount;
}

- (void) initEnemies;
- (void) checkForBulletCollisions;
//- (void) spawnEnemyOfType:(EnemyTypes)enemyType;

@end

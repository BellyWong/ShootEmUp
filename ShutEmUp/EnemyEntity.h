//
//  EnemyEntity.h
//  ShutEmUp
//
//  Created by Cyril Savitsky on 7/20/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Entity.h"
#import "StandardMoveComponent.h"
#import "StandardShootComponent.h"
#import "HealthBarComponent.h"

typedef enum {
    EnemyTypeUfo = 0,
    EnemyTypeCruiser,
    EnemyTypeBoss,
    
    EnemyTypeMAX,
} EnemyTypes;

@interface EnemyEntity : Entity {
    EnemyTypes type;
    int initialHitPoints;
	int hitPoints;
}

@property(readonly,nonatomic) int hitPoints;
@property(readonly,nonatomic) int initialHitPoints;

- (id) initWithType:(EnemyTypes)enemyType;
+ (id) enemyWithType:(EnemyTypes)enemyType;
+ (int) getSpawnFrequencyForEnemyType:(EnemyTypes)enemyType;
- (void) spawn;
- (void) initSpawnFrequency;
- (void) gotHit;


@end

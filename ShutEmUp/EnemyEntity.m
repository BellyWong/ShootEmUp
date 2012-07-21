//
//  EnemyEntity.m
//  ShutEmUp
//
//  Created by Cyril Savitsky on 7/20/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "EnemyEntity.h"


@implementation EnemyEntity

@synthesize initialHitPoints,hitPoints;

static CCArray *spawnFrequency;

- (id) initWithType:(EnemyTypes)enemyType {
    NSString *enemyFrameName;
    NSString *bulletType;
    float shootFrequency = 0.6f;
    initialHitPoints = 1;
    
    switch (enemyType) {
        case EnemyTypeUfo:
            enemyFrameName = @"monster-a.png";
            bulletType = @"shot-a.png";
            break;
        case EnemyTypeCruiser:
            enemyFrameName = @"monster-b.png";
            bulletType = @"shot-b.png";
            shootFrequency = 1.0f;
            initialHitPoints = 3;
            break;
        case EnemyTypeBoss:
            enemyFrameName = @"monster-c.png";
            bulletType = @"shot-c.png";
            shootFrequency = 2.0f;
            initialHitPoints = 5;
            break;
            
        default:
            [NSException exceptionWithName:@"EnemyEntityException" reason:@"unknown enemy type" userInfo:nil];
            break;
    }
    
    if ((self = [super initWithSpriteFrameName:enemyFrameName])) {
        [self addChild:[StandardMoveComponent node]];
         StandardShootComponent *shootComponent = [StandardShootComponent node];
         shootComponent.shootFrequency = shootFrequency;
         shootComponent.bulletFrameName = bulletType;
         
        if (enemyType == EnemyTypeBoss) {
            HealthBarComponent *health = [HealthBarComponent 
                                          spriteWithSpriteFrameName:@"healthbar.png"];
            [self addChild:health];
        }
        
        
         [self addChild:shootComponent];
         
         // enemies start invisible
         self.visible = NO;
         
         [self initSpawnFrequency];      
    }
         
    return self;
}

+(id) enemyWithType:(EnemyTypes)enemyType
{
	return [[[self alloc] initWithType:enemyType] autorelease];
}

- (void) initSpawnFrequency {
    if (spawnFrequency == nil) {
        spawnFrequency = [[CCArray alloc] initWithCapacity:EnemyTypeMAX];
        [spawnFrequency insertObject:[NSNumber numberWithInt:80] atIndex:EnemyTypeUfo];
        [spawnFrequency insertObject:[NSNumber numberWithInt:260] atIndex:EnemyTypeCruiser];
        [spawnFrequency insertObject:[NSNumber numberWithInt:1500] atIndex:EnemyTypeBoss];
        [self spawn];
    }
}

+ (int) getSpawnFrequencyForEnemyType:(EnemyTypes)enemyType {
    NSAssert(enemyType < EnemyTypeMAX, @"invalid enemy type");
    NSNumber *number = [spawnFrequency objectAtIndex:enemyType];
    return [number intValue];
}

- (void) dealloc {
    [spawnFrequency release];
    [super dealloc];
}
-(void) gotHit {
    hitPoints--;
	if (hitPoints <= 0)
	{
		self.visible = NO;
	}
    
}

- (void) spawn {
    CCLOG(@"spawn enemy");
    CGRect screenRect = [GameScene screenRect];
    CGSize enemySize = [self contentSize];
    float xpos = screenRect.size.width + enemySize.width * 0.5f;
    float ypos = CCRANDOM_0_1() * (screenRect.size.height - enemySize.height) + enemySize.height*0.5f;
    self.position = CGPointMake(xpos, ypos);
    self.visible = YES;
    
    hitPoints = initialHitPoints;
    CCNode *node;
    CCARRAY_FOREACH([self children], node) {
        if ([node isKindOfClass:[HealthBarComponent class]]) {
            HealthBarComponent *health = (HealthBarComponent*) node;
            [health reset];
        }
    }
}



@end

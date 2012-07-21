//
//  ParallaxBackground.m
//  ShutEmUp
//
//  Created by Cyril Savitsky on 7/17/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "ParallaxBackground.h"


@implementation ParallaxBackground

- (id) init {
    if (( self = [super init] )) {
        numStripes = 7;
        speedFactors = [[CCArray alloc] initWithCapacity:numStripes];
        [speedFactors addObject:[NSNumber numberWithFloat:0.3f]];
        [speedFactors addObject:[NSNumber numberWithFloat:0.5f]];
        [speedFactors addObject:[NSNumber numberWithFloat:0.5f]];
        [speedFactors addObject:[NSNumber numberWithFloat:0.8f]];
        [speedFactors addObject:[NSNumber numberWithFloat:0.8f]];
        [speedFactors addObject:[NSNumber numberWithFloat:1.2f]];
        [speedFactors addObject:[NSNumber numberWithFloat:1.2f]];
        NSAssert([speedFactors count] == numStripes, @"smt wrong with speedFactors array");
        
        
        CGSize screenSize = [[CCDirector sharedDirector] winSize];
        CCTexture2D *texture = [[CCTextureCache sharedTextureCache] addImage:@"game-art.pvr.ccz"];
        spriteBatch = [CCSpriteBatchNode batchNodeWithTexture:texture];
        [self addChild:spriteBatch];
    
        for (int i = 0; i < numStripes; i++) {
            NSString *frameName = [NSString stringWithFormat:@"bg%i.png",i];
            CCSprite *sprite = [CCSprite spriteWithSpriteFrameName:frameName];
            sprite.anchorPoint = CGPointMake(0, 0.5f);
            sprite.position = CGPointMake(0, screenSize.height/2);
            [spriteBatch addChild:sprite z:i];
        }
        
        for (int i = 0; i < numStripes; i++) {
            NSString *frameName = [NSString stringWithFormat:@"bg%i.png",i];
            
            CCSprite *sprite = [CCSprite spriteWithSpriteFrameName:frameName];
            sprite.flipX = YES;
            sprite.anchorPoint = CGPointMake(0, 0.5f);
            sprite.position = CGPointMake(screenSize.width - 1, screenSize.height/2);
            [spriteBatch addChild:sprite z:i tag:i + numStripes];         
        }
        [self scheduleUpdate];
    }
    return self;
}

- (void) update:(ccTime)delta {
    CCSprite *sprite;
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    CCARRAY_FOREACH([spriteBatch children], sprite) {
        NSNumber *factor = [speedFactors objectAtIndex:sprite.zOrder];
        CGPoint pos = sprite.position;
        pos.x -= [factor floatValue] * (delta * 50);
        
        if (pos.x < -screenSize.width) {
            pos.x = screenSize.width - 2;
        }
        sprite.position = pos;
    }
}

- (void) dealloc {
    [speedFactors release];
    speedFactors = nil;
    [super dealloc];
}

@end

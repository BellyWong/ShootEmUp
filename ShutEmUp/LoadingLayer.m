//
//  LoadingLayer.m
//  ShutEmUp
//
//  Created by Cyril Savitsky on 7/16/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "LoadingLayer.h"


@implementation LoadingLayer

+ (id) sceneWithTargetScene:(TargetScenes)targetScene {
    return [[[self alloc] initWithScene:targetScene] autorelease];
}

- (id) initWithScene:(TargetScenes)targetScene {
    if ( (self = [super init]) ) {
        _target = targetScene;
        CCLabelTTF *loadingLabel = [CCLabelTTF labelWithString:@"Loading..." fontName:@"Helvetica" fontSize:24];

        CGSize size = [[CCDirector sharedDirector] winSize];
        loadingLabel.position = CGPointMake(size.width/2, size.height/2);
        [self addChild:loadingLabel];
        
        [self scheduleUpdate];
    }
    return self;
}

- (void) update: (ccTime) delta {
    [self unscheduleAllSelectors];
    
    //remove unused textures
    [[CCSpriteFrameCache sharedSpriteFrameCache] removeUnusedSpriteFrames];
    [[CCTextureCache sharedTextureCache] removeUnusedTextures];
    
    switch (_target) {
        case TargetSceneFirst:
            [[CCDirector sharedDirector] replaceScene:[GameScene scene]];
            break;
        
        case TargetSceneSecond:
            //second scene
            break;
            
        default:
            NSAssert(nil,@"Smt strange with TargetScene in LoadingLayer.m");
            break;
    }
}

- (void) dealloc {
    
    [super dealloc];
}
/*
- (void) onExit {
    
    [super onExit];
}*/

@end

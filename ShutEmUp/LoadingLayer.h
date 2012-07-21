//
//  LoadingLayer.h
//  ShutEmUp
//
//  Created by Cyril Savitsky on 7/16/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "GameScene.h"

typedef enum {
    TargetSceneFalse,
    TargetSceneFirst,
    TargetSceneSecond,
    TargetSceneMax,
}TargetScenes;

@interface LoadingLayer : CCLayer {
    TargetScenes _target;
}

+ (id) sceneWithTargetScene: (TargetScenes) targetScene;
- (id) initWithScene: (TargetScenes) targetScene;

@end

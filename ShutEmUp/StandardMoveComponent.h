//
//  StandardMoveComponent.h
//  ShutEmUp
//
//  Created by Cyril Savitsky on 7/20/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Entity.h"
#import "GameScene.h"

@interface StandardMoveComponent : CCSprite {
    CGPoint velocity;
}

@end

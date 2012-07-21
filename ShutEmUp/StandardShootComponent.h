//
//  StandardShootComponent.h
//  ShutEmUp
//
//  Created by Cyril Savitsky on 7/20/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "GameScene.h"

@interface StandardShootComponent : CCSprite {
    float updateCount;
	float shootFrequency;
	NSString* bulletFrameName;
}

@property (nonatomic) float shootFrequency;
@property (nonatomic, copy) NSString* bulletFrameName;

@end

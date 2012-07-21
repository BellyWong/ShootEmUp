//
//  InputLayer.h
//  ShutEmUp
//
//  Created by Cyril Savitsky on 7/18/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

#import "ColoredCircleSprite.h"
#import "SneakyButton.h"
#import "SneakyButtonSkinnedBase.h"
#import "SneakyJoystick.h"
#import "SneakyJoystickSkinnedBase.h"
#import "SneakyExtensions.h"
#import "GameScene.h"

@interface InputLayer : CCLayer {
    SneakyButton *fireButton;
    SneakyJoystick *joystick;
    ccTime nextShotTime;
    ccTime totalTime;
}

- (void) addFireButton;
- (void) addJoystick;

@end

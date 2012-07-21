//
//  SneakyExtensions.h
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

@interface SneakyButton (Extension)

+ (id) button;
+ (id) buttonWithRect:(CGRect)rect;

@end

@interface SneakyButtonSkinnedBase (Extension)

+ (id) skinnedButton;

@end

@interface SneakyJoystick (Extension)

+ (id) joystickWithRect:(CGRect)rect;

@end

@interface SneakyJoystickSkinnedBase (Extension)

+ (id) skinnedJoystick;

@end

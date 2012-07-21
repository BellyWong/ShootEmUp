//
//  InputLayer.m
//  ShutEmUp
//
//  Created by Cyril Savitsky on 7/18/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "InputLayer.h"


@implementation InputLayer

- (id) init {
    if ((self = [super init])) {
        [self addFireButton];
        [self addJoystick];
        [self scheduleUpdate];        
    }
    return self;
}

- (void) addFireButton {
    float buttonRadius = 80;
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    
    fireButton = [SneakyButton button];
    //fireButton.radius = buttonRadius;
    
    fireButton.isHoldable = YES;
    SneakyButtonSkinnedBase *skinFireButton = [SneakyButtonSkinnedBase skinnedButton];
    skinFireButton.position = CGPointMake(screenSize.width - buttonRadius, buttonRadius);
    skinFireButton.defaultSprite = [CCSprite spriteWithSpriteFrameName:@"fire-button-idle.png"];
    skinFireButton.pressSprite = [CCSprite spriteWithSpriteFrameName:@"fire-button-pressed.png"];
    skinFireButton.button = fireButton;
    
    [self addChild:skinFireButton];
}

- (void) addJoystick {
    float stickRadius = 90;
    
    joystick = [SneakyJoystick joystickWithRect:CGRectMake(0, 0, stickRadius, stickRadius)];
    joystick.autoCenter = YES;
    joystick.hasDeadzone = YES;
    joystick.deadRadius = 10;
    joystick.isDPad = YES;
    joystick.numberOfDirections = 8;
    
    SneakyJoystickSkinnedBase *skinnedJoystick = [SneakyJoystickSkinnedBase skinnedJoystick];
    skinnedJoystick.position = CGPointMake(stickRadius, stickRadius);
    skinnedJoystick.backgroundSprite = [CCSprite spriteWithSpriteFrameName:@"joystick-back.png"];
    skinnedJoystick.backgroundSprite.color = ccYELLOW;
    skinnedJoystick.thumbSprite = [CCSprite spriteWithSpriteFrameName:@"joystick-stick.png"];
    skinnedJoystick.joystick = joystick;
    [self addChild:skinnedJoystick];
}

- (void) update:(ccTime)delta {
    totalTime += delta;
    GameScene *gameScene = [GameScene sharedGameScene];
    BattleShip *ship = [gameScene defaultShip];
    if (fireButton.active && totalTime > nextShotTime) {
        nextShotTime = totalTime + 0.5f;
        
        CCLOG(@"FIRE MOTHERFUCKER!");
        BulletCache *cache = [gameScene getBulletCache];
        CGPoint shotPos = CGPointMake(ship.position.x + 45, ship.position.y - 19);
        float spread = (CCRANDOM_0_1() - 0.5f) * 0.5f;
        CGPoint velocity = CGPointMake(200, spread * 50);
        [cache shootBullet:shotPos velocity:velocity frameName:@"bullet.png"];   
    }    
    if (fireButton.active == NO)
        nextShotTime = 0;
    CGPoint velocity = ccpMult(joystick.velocity, 7000 * delta);

    if (velocity.x != 0 && velocity.y != 0) {
        CCLOG(@"X: %f, Y: %f",joystick.velocity.x, joystick.velocity.y);
        ship.position = CGPointMake(ship.position.x + velocity.x * delta, ship.position.y + velocity.y * delta);
    }
    
}

- (void) dealloc {
    [super dealloc];
}

@end

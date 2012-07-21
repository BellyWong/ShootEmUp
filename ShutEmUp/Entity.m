//
//  Entity.m
//  ShutEmUp
//
//  Created by Cyril Savitsky on 7/20/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Entity.h"
#import "GameScene.h"

@implementation Entity

- (void) setPosition:(CGPoint)position {
    if ([self isOutsideTheArea]) {
        CGSize screenSize = [[CCDirector sharedDirector] winSize];
        float halfWidth = contentSize_.width * 0.5f;
        float halfHeight = contentSize_.width * 0.5f;
    
        if (position.x < halfWidth)
            position.x = halfWidth;
        else if (position.x > (screenSize.width - halfWidth))
            position.x = screenSize.width - halfWidth;
    
        if (position.y < halfHeight)
            position.y = halfHeight;
        else if (position.y > (screenSize.height - halfHeight))
            position.y = screenSize.height - halfHeight;
    }
    [super setPosition:position];        
}

- (BOOL) isOutsideTheArea {
    return (CGRectContainsRect([GameScene screenRect], [self boundingBox]));
}
            
@end

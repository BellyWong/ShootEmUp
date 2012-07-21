//
//  Entity.h
//  ShutEmUp
//
//  Created by Cyril Savitsky on 7/20/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"



@class Component;

@interface Entity : CCSprite {
    
}

- (void) setPosition:(CGPoint)position;

@end

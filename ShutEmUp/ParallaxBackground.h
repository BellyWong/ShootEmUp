//
//  ParallaxBackground.h
//  ShutEmUp
//
//  Created by Cyril Savitsky on 7/17/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface ParallaxBackground : CCNode {
    CCSpriteBatchNode *spriteBatch;
    float scrollSpeed;
    int numStripes;
    CCArray *speedFactors;
}

@end

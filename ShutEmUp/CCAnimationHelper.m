//
//  CCAnimationHelper.m
//  ShutEmUp
//
//  Created by Cyril Savitsky on 7/16/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "CCAnimationHelper.h"


@implementation CCAnimation (Helper)

+ (CCAnimation*) createAnimationWithFile:(NSString *)name
                              frameCount:(int)frameCount delay:(float)delay {
    NSMutableArray *frames = [NSMutableArray arrayWithCapacity:frameCount];
    for (int i = 0; i < frameCount; i++) {
        NSString *fileName = [NSString stringWithFormat:@"%@%i.png",name,i];
        CCTexture2D *texture = [[CCTextureCache sharedTextureCache] addImage:fileName];
        CGSize textureSize = texture.contentSize;
        CGRect textureRect = CGRectMake(0,0, textureSize.width, textureSize.height);
        
        CCSpriteFrame *frame = [CCSpriteFrame frameWithTexture:texture rect:textureRect];
        
        [frames addObject:frame];
    }
    
    return [CCAnimation animationWithSpriteFrames:frames delay:delay];
}

+ (CCAnimation*) createAnimationWithFrames:(NSString *)name
                                frameCount:(int)frameCount delay:(float)delay {
    NSMutableArray *frames = [NSMutableArray arrayWithCapacity:frameCount];
    for (int i = 0; i < frameCount; i++) {
        NSString *fileName = [NSString stringWithFormat:@"%@%i.png",name,i];
        CCSpriteFrameCache *frameCache = [CCSpriteFrameCache sharedSpriteFrameCache];
        CCSpriteFrame *frame = [frameCache spriteFrameByName:fileName];
        [frames addObject:frame];
    }
    return [CCAnimation animationWithSpriteFrames:frames delay:delay];
}
@end

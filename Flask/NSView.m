//
//  NSView.m
//  Flask
//
//  Created by Samuliak on 25/11/2024.
//

#include "Common.h"

@implementation NSView {
    TqlObject* obj;
}

DEFINE_GET_TQL_OBJECT

- (instancetype)initWithFrame:(NSRect)frameRect {
    self = [super init];
    
    self->obj = tqlObjectCreate(self);
    tqlViewCreate(self->obj, NSRectToCGRect(frameRect));
    
    return self;
}

- (instancetype)init {
    self = [self initWithFrame:NSMakeRect(0.0f, 0.0f, 0.0f, 0.0f)];
    
    return self;
}

- (void)setWantsLayer:(BOOL)wantsLayer {
    // Do nothing
}

- (CALayer*)layer {
    return tqlViewGetLayer(obj);
}

- (void)setLayer:(CALayer*)layer {
    // TODO: only do this in debug
    NSLog(@"error: cannot manually set view's layer");
}

@end

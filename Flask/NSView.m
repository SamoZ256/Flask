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

- (CALayer*)layer {
    return tqlViewGetLayer(obj);
}

- (void)setLayer:(CALayer*)layer {
    tqlViewSetLayer(self->obj, layer);
}

- (CALayer*)makeBackingLayer {
    return [CALayer layer];
}

- (void)setWantsLayer:(BOOL)wantsLayer {
    if (wantsLayer) {
        self.layer = [self makeBackingLayer];
    }
}

@end

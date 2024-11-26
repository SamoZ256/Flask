//
//  NSColor.m
//  Flask
//
//  Created by Samuliak on 25/11/2024.
//

#include "Common.h"

static NSColor* __yellowColor = nil;

@implementation NSColor {
    TqlObject* obj;
}

+ (NSColor*)yellowColor {
    if (!__yellowColor) {
        __yellowColor = [[NSColor alloc] init];
        __yellowColor->obj = tqlObjectCreate(__yellowColor);
        tqlColorYellowCreate(__yellowColor->obj);
    }
    
    return __yellowColor;
}

- (CGColorRef)CGColor {
    return tqlColorCGColor(self->obj);
}

@end

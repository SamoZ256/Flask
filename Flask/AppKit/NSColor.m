//
//  NSColor.m
//  Flask
//
//  Created by Samuliak on 25/11/2024.
//

#import <AppKit/AppKit.h>

#include "Common.h"

static NSColor* __yellowColor = nil;

@implementation NSColor {
    TqlObject* obj;
}

+ (NSColor*)yellowColor {
    if (!__yellowColor) {
        __yellowColor = [[NSColor alloc] init];
        __yellowColor->obj = tqlObjectCreate(__yellowColor);
        tqlColorCreateYellow(__yellowColor->obj);
    }
    
    return __yellowColor;
}

- (CGColorRef)CGColor {
    return tqlColorCGColor(self->obj);
}

@end

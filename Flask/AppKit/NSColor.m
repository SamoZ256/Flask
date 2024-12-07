//
//  NSColor.m
//  Flask
//
//  Created by Samuliak on 25/11/2024.
//

#import <AppKit/AppKit.h>

#include "Common.h"

#define DEFINE_COLOR_GETTER(color, colorCapitalized) \
+ (NSColor*)color##Color { \
    static NSColor* __color##Color; \
\
    if (!__color##Color) { \
        __color##Color = [[NSColor alloc] init]; \
        __color##Color->obj = tqlObjectCreate(__color##Color); \
        tqlColorCreate##colorCapitalized(__color##Color->obj); \
    } \
\
    return __color##Color; \
}

@implementation NSColor {
    TqlObject* obj;
}

DEFINE_COLOR_GETTER(black, Black)
DEFINE_COLOR_GETTER(darkGray, DarkGray)
DEFINE_COLOR_GETTER(lightGray, LightGray)
DEFINE_COLOR_GETTER(white, White)
DEFINE_COLOR_GETTER(gray, Gray)
DEFINE_COLOR_GETTER(red, Red)
DEFINE_COLOR_GETTER(green, Green)
DEFINE_COLOR_GETTER(blue, Blue)
DEFINE_COLOR_GETTER(cyan, Cyan)
DEFINE_COLOR_GETTER(yellow, Yellow)
DEFINE_COLOR_GETTER(magenta, Magenta)
DEFINE_COLOR_GETTER(orange, Orange)
DEFINE_COLOR_GETTER(purple, Purple)
DEFINE_COLOR_GETTER(brown, Brown)
DEFINE_COLOR_GETTER(clear, Clear)

- (CGColorRef)CGColor {
    return tqlColorCGColor(self->obj);
}

@end

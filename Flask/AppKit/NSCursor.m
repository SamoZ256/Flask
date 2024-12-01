//
//  NSCursor.m
//  Flask
//
//  Created by Samuliak on 01/12/2024.
//

#import <AppKit/AppKit.h>

#include "Common.h"

@implementation NSCursor

+ (void)hide {
    tqlCursorHide();
}

+ (void)unhide {
    tqlCursorUnhide();
}

@end

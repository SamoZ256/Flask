//
//  NSApplication.m
//  Flask
//
//  Created by Samuliak on 23/11/2024.
//

#import <AppKit/AppKit.h>

#include "Common.h"

static NSApplication* __sharedApplication = nil;

@implementation NSApplication {
    TqlObject* obj;
}

+ (__kindof NSApplication*)sharedApplication {
    if (!__sharedApplication) {
        __sharedApplication = [[NSApplication alloc] init];
        __sharedApplication->obj = tqlObjectCreate(__sharedApplication);
        tqlApplicationCreateShared(__sharedApplication->obj);
    }
    
    return __sharedApplication;
}

@end

id _Nonnull defaultAppDelegateCreateCallback(TqlObject* _Nonnull obj) {
    // TODO: what should be the class name?
    id appDelegate = [[NSClassFromString(@"AppDelegate") alloc] init];
    
    return appDelegate;
}

void appDelegateApplicationDidFinishLaunching(TqlObject* _Nonnull obj) {
    // TODO: don't pass NULL
    [obj->host applicationDidFinishLaunching:NULL];
}

extern int NSApplicationMain(int argc, const char* _Nonnull argv[_Nonnull]) {
    installCallbacks();
    
    return tqlApplicationMain(argc, argv);
}

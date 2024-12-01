//
//  NSApplication.m
//  Flask
//
//  Created by Samuliak on 23/11/2024.
//

#import <AppKit/AppKit.h>

#include "Common.h"

id _Nonnull defaultAppDelegateCreateCallback(TqlObject* _Nonnull obj) {
    // TODO: what should be the class name?
    id appDelegate = [[NSClassFromString(@"AppDelegate") alloc] init];
    
    return appDelegate;
}

void applicationDidFinishLaunching(TqlObject* _Nonnull obj) {
    // TODO: don't pass NULL
    [obj->host applicationDidFinishLaunching:NULL];
}

extern int NSApplicationMain(int argc, const char* _Nonnull argv[_Nonnull]) {
    installCallbacks();
    
    return tqlApplicarionMain(argc, argv);
}

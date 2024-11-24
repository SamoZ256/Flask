//
//  NSApplication.m
//  Flask
//
//  Created by Samuliak on 23/11/2024.
//

#include "Common.h"

id _Nonnull defaultAppDelegateCreateCallback(TqlObject* _Nonnull obj) {
    id appDelegate = [[NSClassFromString(@"AppDelegate") alloc] init];
    
    return appDelegate;
}

void applicationDidFinishLaunching(TqlObject* _Nonnull obj) {
    // TODO: don't pass NULL
    [obj->host applicationDidFinishLaunching:NULL];
}

extern int NSApplicationMain(int argc, const char* _Nonnull argv[_Nonnull]) {
    tqlSetDefaultAppDelegateCreateCallback(defaultAppDelegateCreateCallback);
    tqlSetApplicationDidFinishLaunchingCallback(applicationDidFinishLaunching);
    
    return tqlApplicarionMain(argc, argv);
}

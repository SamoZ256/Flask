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

extern int NSApplicationMain(int argc, const char* _Nonnull argv[_Nonnull]) {
    tqlSetDefaultAppDelegateCreateCallback(defaultAppDelegateCreateCallback);
    
    return tqlApplicarionMain(argc, argv);
}

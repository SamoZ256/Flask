//
//  NSApplication.m
//  Flask
//
//  Created by Samuliak on 23/11/2024.
//

#include "Common.h"

id _Nonnull defaultAppDelegateCreateCallback(TqlObject* _Nonnull obj) {
    // TODO: what should be the class name?
    id appDelegate = [[NSClassFromString(@"AppDelegate") alloc] init];
    
    return appDelegate;
}

id _Nonnull defaultViewControllerCreateCallback(TqlObject* _Nonnull obj) {
    // TODO: what should be the class name?
    id viewController = [[NSClassFromString(@"ViewController") alloc] init];
    
    return viewController;
}

void applicationDidFinishLaunching(TqlObject* _Nonnull obj) {
    // TODO: don't pass NULL
    [obj->host applicationDidFinishLaunching:NULL];
}

void viewDidLoad(TqlObject* _Nonnull obj) {
    [obj->host viewDidLoad];
}

extern int NSApplicationMain(int argc, const char* _Nonnull argv[_Nonnull]) {
    tqlSetDefaultAppDelegateCreateCallback(defaultAppDelegateCreateCallback);
    tqlSetDefaultViewControllerCreateCallback(defaultViewControllerCreateCallback);
    
    tqlSetApplicationDidFinishLaunchingCallback(applicationDidFinishLaunching);
    tqlSetViewDidLoadCallback(viewDidLoad);
    
    return tqlApplicarionMain(argc, argv);
}

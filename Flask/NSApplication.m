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

void applicationDidFinishLaunching(TqlObject* _Nonnull obj) {
    // TODO: don't pass NULL
    [obj->host applicationDidFinishLaunching:NULL];
}

void viewControllerViewDidLoad(TqlObject* _Nonnull obj) {
    [obj->host viewDidLoad];
}

void viewControllerLoadView(TqlObject* _Nonnull obj) {
    [obj->host loadView];
}

extern int NSApplicationMain(int argc, const char* _Nonnull argv[_Nonnull]) {
    tqlSetDefaultAppDelegateCreateCallback(defaultAppDelegateCreateCallback);
    tqlSetDefaultViewControllerCreateCallback(defaultViewControllerCreateCallback);
    
    tqlSetApplicationDidFinishLaunchingCallback(applicationDidFinishLaunching);
    tqlSetViewControllerViewDidLoadCallback(viewControllerViewDidLoad);
    tqlSetViewControllerLoadViewCallback(viewControllerLoadView);
    
    return tqlApplicarionMain(argc, argv);
}

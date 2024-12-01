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

void viewControllerViewDidLoad(TqlObject* _Nonnull obj) {
    [obj->host viewDidLoad];
}

void viewControllerLoadView(TqlObject* _Nonnull obj) {
    [obj->host loadView];
}

Class _Nonnull viewGetLayerClass(TqlObject* _Nonnull obj) {
    return [[obj->host makeBackingLayer] class];
}

extern int NSApplicationMain(int argc, const char* _Nonnull argv[_Nonnull]) {
    // Callbacks
    
    // Default create
    tqlSetDefaultAppDelegateCreateCallback(defaultAppDelegateCreateCallback);
    tqlSetDefaultViewControllerCreateCallback(defaultViewControllerCreateCallback);
    
    // Methods
    
    // Application
    tqlSetApplicationDidFinishLaunchingCallback(applicationDidFinishLaunching);
    
    // View controller
    tqlSetViewControllerViewDidLoadCallback(viewControllerViewDidLoad);
    tqlSetViewControllerLoadViewCallback(viewControllerLoadView);
    
    // View
    tqlSetViewGetLayerClassCallback(viewGetLayerClass);
    
    return tqlApplicarionMain(argc, argv);
}

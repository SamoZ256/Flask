//
//  Common.m
//  Flask
//
//  Created by Samuliak on 01/12/2024.
//

#include "Common.h"

void installCallbacks(void) {
    // Default create
    tqlSetDefaultAppDelegateCreateCallback(defaultAppDelegateCreateCallback);
    tqlSetDefaultViewControllerCreateCallback(defaultViewControllerCreateCallback);
    
    // Methods
    
    // Application delegate
    tqlSetAppDelegateApplicationDidFinishLaunchingCallback(appDelegateApplicationDidFinishLaunching);
    
    // View controller
    tqlSetViewControllerViewDidLoadCallback(viewControllerViewDidLoad);
    tqlSetViewControllerLoadViewCallback(viewControllerLoadView);
    
    // View
    tqlSetViewGetLayerClassCallback(viewGetLayerClass);
}

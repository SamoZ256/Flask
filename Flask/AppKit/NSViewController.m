//
//  NSViewDelegate.m
//  Flask
//
//  Created by Samuliak on 24/11/2024.
//

#import <AppKit/AppKit.h>

#include "Common.h"

static TqlObject* defaultObject = NULL;

@implementation NSViewController {
    TqlObject* obj;
}

DEFINE_GET_TQL_OBJECT

// This method shouldn't really be used, but that doesn't matter
- (instancetype)init {
    self = [super init];
    
    // A hacky way to grab the Tequila object
    if (defaultObject) {
        self->obj = defaultObject;
    } else {
        self->obj = tqlObjectCreate(self);
        tqlViewControllerCreate(self->obj);
    }
    
    return self;
}

- (void)loadView {
    self.view = [[NSView alloc] init];
}

- (void)viewDidLoad {
    // TODO: is it okay to set the view here?
    tqlViewControllerSetView(self->obj, GET_TQL_OBJECT(self.view));
}

@end

id _Nonnull defaultViewControllerCreateCallback(TqlObject* _Nonnull obj) {
    defaultObject = obj;
    // TODO: what should be the class name?
    id viewController = [[NSClassFromString(@"ViewController") alloc] init];
    defaultObject = NULL;
    
    return viewController;
}

void viewControllerViewDidLoad(TqlObject* _Nonnull obj) {
    [obj->host viewDidLoad];
}

void viewControllerLoadView(TqlObject* _Nonnull obj) {
    [obj->host loadView];
}

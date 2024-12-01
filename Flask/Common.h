//
//  Common.h
//  Flask
//
//  Created by Samuliak on 24/11/2024.
//

#ifndef Common_h
#define Common_h

#include "Tequila.h"

#define DEFINE_GET_TQL_OBJECT \
- (TqlObject*) getTqlObject { \
    return self->obj; \
}

#define GET_TQL_OBJECT(obj) [(id)obj getTqlObject]

// Callbacks

// Default create
id _Nonnull defaultViewControllerCreateCallback(TqlObject* _Nonnull obj);
id _Nonnull defaultAppDelegateCreateCallback(TqlObject* _Nonnull obj);

// Methods

// Application delegate
void appDelegateApplicationDidFinishLaunching(TqlObject* _Nonnull obj);

// View controller
void viewControllerViewDidLoad(TqlObject* _Nonnull obj);
void viewControllerLoadView(TqlObject* _Nonnull obj);

// View
Class _Nonnull viewGetLayerClass(TqlObject* _Nonnull obj);

void installCallbacks(void);

#endif /* Common_h */

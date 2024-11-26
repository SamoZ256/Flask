//
//  Common.h
//  Flask
//
//  Created by Samuliak on 24/11/2024.
//

#ifndef Common_h
#define Common_h

#import <AppKit/AppKit.h>

#include "Tequila.h"

#define DEFINE_GET_TQL_OBJECT \
- (TqlObject*) getTqlObject { \
    return self->obj; \
}

#define GET_TQL_OBJECT(obj) [(id)obj getTqlObject]

id _Nonnull defaultViewControllerCreateCallback(TqlObject* _Nonnull obj);

#endif /* Common_h */

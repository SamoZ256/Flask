//
//  MTKView.m
//  Flask
//
//  Created by Samuliak on 01/12/2024.
//

#import <MetalKit/MetalKit.h>

#include "Common.h"

#define METAL_LAYER ((CAMetalLayer*)self.layer)

@implementation MTKView {
    CGSize lastDrawableSize;
}

- (instancetype)initWithFrame:(CGRect)frameRect device:(id<MTLDevice>)device {
    self = [super initWithFrame:frameRect];
    
    self->_device = device;
    
    // Default values
    self.colorPixelFormat = MTLPixelFormatBGRA8Unorm;
    self.framebufferOnly = YES;
    self.clearColor = MTLClearColorMake(0.0, 0.0, 0.0, 1.0);
    self.depthStencilPixelFormat = MTLPixelFormatInvalid;
    self.depthStencilAttachmentTextureUsage = MTLTextureUsageRenderTarget;
    self.clearDepth = 1.0;
    self.clearStencil = 0;
    self.sampleCount = 1;
    self.multisampleColorAttachmentTextureUsage = MTLTextureUsageRenderTarget;
    
    // TODO: use display link instead
    [NSTimer scheduledTimerWithTimeInterval:1.0/60.0 target:self selector:@selector(draw) userInfo:nil repeats:YES];
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frameRect {
    self = [self initWithFrame:frameRect device:nil];
    
    return self;
}

- (CALayer*)makeBackingLayer {
    return [CAMetalLayer layer];
}

- (MTLPixelFormat)colorPixelFormat {
    return METAL_LAYER.pixelFormat;
}

- (void)setColorPixelFormat:(MTLPixelFormat)colorPixelFormat {
    METAL_LAYER.pixelFormat = colorPixelFormat;
}

- (BOOL)framebufferOnly {
    return METAL_LAYER.framebufferOnly;
}

- (void)setFramebufferOnly:(BOOL)framebufferOnly {
    METAL_LAYER.framebufferOnly = framebufferOnly;
}

- (void)draw {
    self->_currentDrawable = [METAL_LAYER nextDrawable];
    if (!self->_currentDrawable) {
        NSLog(@"No drawable, skipping draw");
    }
    
    // Check for drawable size change
    bool drawableSizeChanged = false;
    if (self->lastDrawableSize.width != self.layer.frame.size.width || self->lastDrawableSize.height != self.layer.frame.size.height) {
        self->lastDrawableSize = self.layer.frame.size;
        drawableSizeChanged = true;
    }
    
    if (drawableSizeChanged) {
        [self->_delegate mtkView:self drawableSizeWillChange:self.layer.frame.size];
    }
    
    // Create depth stencil texture if needed
    if (self->_depthStencilPixelFormat != MTLPixelFormatInvalid && (!self->_depthStencilTexture || drawableSizeChanged || self->_depthStencilTexture.pixelFormat != self->_depthStencilPixelFormat || self->_depthStencilTexture.storageMode != self->_depthStencilStorageMode || self->_depthStencilTexture.usage != self->_depthStencilAttachmentTextureUsage)) {
        MTLTextureDescriptor* textureDesc = [MTLTextureDescriptor new];
        textureDesc.textureType = MTLTextureType2D;
        textureDesc.pixelFormat = self->_depthStencilPixelFormat;
        textureDesc.width = self.layer.frame.size.width;
        textureDesc.height = self.layer.frame.size.height;
        textureDesc.storageMode = self->_depthStencilStorageMode;
        textureDesc.usage = self->_depthStencilAttachmentTextureUsage;
        
        self->_depthStencilTexture = [self->_device newTextureWithDescriptor:textureDesc];
    }
    
    // TODO: multisample color attachment texture
    
    // Render pass descriptor
    // TODO: should the load actions always be clear?
    self->_currentRenderPassDescriptor = [MTLRenderPassDescriptor new];
    self->_currentRenderPassDescriptor.colorAttachments[0].texture = self->_currentDrawable.texture;
    self->_currentRenderPassDescriptor.colorAttachments[0].loadAction = MTLLoadActionClear;
    self->_currentRenderPassDescriptor.colorAttachments[0].clearColor = self->_clearColor;
    self->_currentRenderPassDescriptor.depthAttachment.texture = self->_depthStencilTexture;
    self->_currentRenderPassDescriptor.depthAttachment.loadAction = MTLLoadActionClear;
    self->_currentRenderPassDescriptor.depthAttachment.clearDepth = self->_clearDepth;
    self->_currentRenderPassDescriptor.stencilAttachment.loadAction = MTLLoadActionClear;
    self->_currentRenderPassDescriptor.stencilAttachment.clearStencil = self->_clearStencil;
    
    [self->_delegate drawInMTKView:self];
}

@end

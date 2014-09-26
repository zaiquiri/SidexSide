#import "ImageResizer.h"

@implementation ImageResizer

- (UIImage *) resizeImage:(UIImage *)originalImage toSize:(CGSize)size {
    
    CGImageRef imageRef = originalImage.CGImage;
    CGRect newRect = CGRectIntegral(CGRectMake(0, 0, size.width, size.height));
    CGContextRef bitmap = CGBitmapContextCreate(NULL,
                                                newRect.size.width,
                                                newRect.size.height,
                                                CGImageGetBitsPerComponent(imageRef),
                                                0,
                                                CGImageGetColorSpace(imageRef),
                                                CGImageGetBitmapInfo(imageRef));
    CGContextSetInterpolationQuality(bitmap, kCGInterpolationHigh);
    CGContextDrawImage(bitmap, newRect, imageRef);
    CGImageRef newImageRef = CGBitmapContextCreateImage(bitmap);
    
    return [UIImage imageWithCGImage:newImageRef];
}

@end

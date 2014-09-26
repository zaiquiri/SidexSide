#import "ImageResizer.h"

@implementation ImageResizer

- (UIImage *) resizeImage:(UIImage *)originalImage forRect:(CGRect)rect {
    
    CGFloat horizontalRatio = rect.size.width / originalImage.size.width;
    CGFloat verticalRatio = rect.size.height / originalImage.size.height;
    CGFloat ratio = MIN(horizontalRatio, verticalRatio);
    
    CGSize size = CGSizeMake(originalImage.size.width * ratio, originalImage.size.height * ratio);
    
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

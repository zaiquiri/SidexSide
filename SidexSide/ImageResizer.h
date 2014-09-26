#import <Foundation/Foundation.h>

@interface ImageResizer : NSObject

- (UIImage *)resizeImage:(UIImage *)originalImage toSize:(CGSize)size;

@end

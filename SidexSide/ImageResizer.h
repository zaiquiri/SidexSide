#import <Foundation/Foundation.h>

@interface ImageResizer : NSObject

- (UIImage *)resizeImage:(UIImage *)originalImage forRect:(CGRect)rect;

@end

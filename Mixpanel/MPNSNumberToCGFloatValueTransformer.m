//
// Copyright (c) 2014 Mixpanel. All rights reserved.

#import "MPValueTransformers.h"


@implementation MPNSNumberToCGFloatValueTransformer

+ (Class)transformedValueClass
{
    return [NSNumber class];
}

+ (BOOL)allowsReverseTransformation
{
    return NO;
}

- (id)transformedValue:(id)value
{
    if ([value isKindOfClass:[NSNumber class]]) {
        NSNumber *number = (NSNumber *) value;

        // if the number is not a cgfloat, cast it to a cgfloat
        if (strcmp([number objCType], (char *) @encode(CGFloat)) != 0) {
            CGFloat primitive;

            
            if (strcmp((char *) @encode(CGFloat), (char *) @encode(double)) == 0) {
                value = [NSNumber numberWithDouble:(CGFloat) [number doubleValue]];
            } else {
                value = [NSNumber numberWithFloat:(CGFloat) [number floatValue]];
            }
        }

        return value;
    }

    return nil;
}

@end

//
//  RuntimeHelper.h
//  UltimateTool
//
//  Created by Victor Chandra on 3/6/13.
//  Copyright (c) 2013 ThreeMonkee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface RuntimeHelper : NSObject

+(NSArray*)arrayClass;
+(NSArray*)arrayProtocol;

@end

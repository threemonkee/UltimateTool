//
//  RuntimeHelper.m
//  UltimateTool
//
//  Created by Victor Chandra on 3/6/13.
//  Copyright (c) 2013 ThreeMonkee. All rights reserved.
//

#import "RuntimeHelper.h"

@implementation RuntimeHelper

+(NSArray*)arrayClass
{
    NSMutableArray *returnArray = [NSMutableArray array];
    
    Class *classes = NULL;
    int numClasses = objc_getClassList(NULL, 0);
    //NSLog(@"Number of classes: %d", numClasses);
    
    if (numClasses > 0)
    {
        classes = (__unsafe_unretained Class *) malloc(sizeof(Class) * numClasses);
        numClasses = objc_getClassList(classes, numClasses);
                
        for (int i = 0; i < numClasses; i++)
        {
            NSMutableDictionary *dictThisClass = [NSMutableDictionary dictionary];
            
            // Class Name
            const char *name = class_getName(classes[i]);
            //NSLog(@"Class name: %s.", name);
            NSString *stringClassName = [NSString stringWithCString:name encoding:NSUTF8StringEncoding];
            [dictThisClass setObject:stringClassName forKey:@"name"];
            
            // Class Method List
            int unsigned nClass = 0;
            Method *methods = class_copyMethodList(objc_getMetaClass(name), &nClass);
            //NSLog(@"NAME: %s. %d Class Methods", name, mcClass);
            NSMutableArray *arrayClassMethod = [NSMutableArray array];
            for (int j = 0; j < nClass; j++){
                //NSLog(@"      Class Method no #%d: %@", j, NSStringFromSelector(method_getName(methods[j])));
                NSString *stringClassMethodName = NSStringFromSelector(method_getName(methods[j]));
                //NSLog(@"      Class Method no #%d: %@", j, stringClassMethodName);
                [arrayClassMethod addObject:stringClassMethodName];
            }
            arrayClassMethod = (NSMutableArray*)[arrayClassMethod sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
            [dictThisClass setObject:arrayClassMethod forKey:@"class_method"];
            
            // Instance Method List
            unsigned int nInstance = 0;
            Method *mlist = class_copyMethodList(classes[i], &nInstance);
            //NSLog(@"NAME: %s. %d Instance Methods", name, mcInstance);
            NSMutableArray *arrayInstanceMethod = [NSMutableArray array];
            for(int k=0 ; k<nInstance ; k++){
                SEL selector = method_getName(mlist[k]);
                //NSLog(@"      Instance Method no #%d: %s", k, sel_getName(selector));
                NSString *stringInstanceMethodName = NSStringFromSelector(selector);
                //NSLog(@"     Instance Method : %@", stringInstanceMethodName);
                [arrayInstanceMethod addObject:stringInstanceMethodName];
            }
            arrayInstanceMethod = (NSMutableArray*)[arrayInstanceMethod sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
            [dictThisClass setObject:arrayInstanceMethod forKey:@"instance_method"];
            
            // Property List
            unsigned int nProperty = 0;
            objc_property_t *theProperty = class_copyPropertyList(classes[i], &nProperty);
            NSMutableArray *arrayProperty = [NSMutableArray array];
            for(int l=0 ; l<nProperty ; l++){
                const char *propertyName = property_getName(theProperty[l]);
                NSString *stringPropertyName = [NSString stringWithCString:propertyName encoding:NSUTF8StringEncoding];
                //NSLog(@"     Property : %@", stringPropertyName);
                [arrayProperty addObject:stringPropertyName];
            }
            arrayProperty = (NSMutableArray*)[arrayProperty sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
            [dictThisClass setObject:arrayProperty forKey:@"property"];
            
            // Protocol List
            unsigned int nProtocol = 0;
            Protocol **theProtocol =  class_copyProtocolList(classes[i], &nProtocol);
            NSMutableArray *arrayProtocol = [NSMutableArray array];
            for(int m=0 ; m<nProtocol ; m++){
                const char *protocolName = protocol_getName(theProtocol[m]);
                NSString *stringProtocolName = [NSString stringWithCString:protocolName encoding:NSUTF8StringEncoding];
                //NSLog(@"     Property : %@", stringPropertyName);
                [arrayProtocol addObject:stringProtocolName];
            }
            arrayProtocol = (NSMutableArray*)[arrayProtocol sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
            [dictThisClass setObject:arrayProtocol forKey:@"protocol"];
            
            [returnArray addObject:dictThisClass];
            
        }
        
        free(classes);
    }
    
    //_arrayClass = [arrayClassName sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    NSSortDescriptor *nameDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:NO selector:@selector(localizedCaseInsensitiveCompare:)];
    NSArray *descriptors = [NSArray arrayWithObjects:nameDescriptor, nil];
    returnArray = (NSMutableArray*)[returnArray sortedArrayUsingDescriptors:descriptors];
    return returnArray;
}

+(NSArray*)arrayProtocol
{
    NSMutableArray *returnArray = [NSMutableArray array];
    unsigned int numProtocol = 0;
    Protocol **protocol = objc_copyProtocolList(&numProtocol);
    
    if (numProtocol > 0){
        for (int i = 0; i < numProtocol; i++)
        {
            const char *name = protocol_getName(protocol[i]);
            NSString *stringName = [NSString stringWithCString:name encoding:NSUTF8StringEncoding];
            [returnArray addObject:stringName];
        }
        free(protocol);
    }
    
    returnArray = (NSMutableArray*)[returnArray sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    return returnArray;
}

@end

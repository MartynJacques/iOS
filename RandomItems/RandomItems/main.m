//
//  main.m
//  RandomItems
//
//  Created by Martyn Jacques on 28/01/2015.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //Create a mutable array object, store its adddres ini items variable
        NSMutableArray *items = [[NSMutableArray alloc] init];
        
        for(int i=0; i<10; i++) {
            BNRItem *item = [BNRItem randomItem];
            [items addObject:item];
        }
                
        for(BNRItem *item in items) {
            NSLog(@"%@", item);
        }
        
        //Destroy the mutable array object
        items = nil;
    }
    return 0;
}

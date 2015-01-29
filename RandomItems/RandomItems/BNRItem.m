//
//  BNRItem.m
//  RandomItems
//
//  Created by Martyn Jacques on 28/01/2015.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem

- (instancetype)init
{
    return [self initWithItemName:@"Item"];
}

- (instancetype)initWithItemName:(NSString *)name
                  valueinDollars:(int)value
                    serialNumber:(NSString *)sNumber
{
    //Call the superclass's designated initialiser
    self = [super init];
    
    //Did the superclass's designated initialiser succeed?
    if(self) {
        //Give the instance variables initial values
        _itemName = name;
        _serialNumber = sNumber;
        _valueInDollars = value;
        //Set _datecreated to the current date and time
        _dateCreated = [[NSDate alloc] init];
    }
    
    //Return the address of the newly initialised object
    return self;
}

- (void)dealloc
{
    NSLog(@"Destroyed: %@", self);
}

- (instancetype)initWithItemName:(NSString *)name
{
    return [self initWithItemName:name
                   valueinDollars:0
                     serialNumber:@""];
}

+ (instancetype)randomItem
{
    //Create an immutable array of three adjectives
    NSArray *randomAdjectiveList = @[@"Fluffy", @"Rusty", @"Shiny"];
    
    //Create an immutable array of three nouns
    NSArray *randomNounList = @[@"Bear", @"Spork", @"Mac"];
    
    //Get the indexc of a random adjective/noun from the lists
    //Note: the % operator, called the modulo operator, gives
    //the remainder. So adjectiveIndex is a random number
    //from 0 to 2 inclusive.
    NSInteger adjectiveIndex = arc4random() % [randomAdjectiveList count];
    NSInteger nounIndex = arc4random() % [randomNounList count];
    
    NSString *randomName = [NSString stringWithFormat:@"%@ %@",
                                randomAdjectiveList[adjectiveIndex],
                                randomNounList[nounIndex]];
    
    int randomValue = arc4random() % 100;
    
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                        '0' + arc4random() % 10,
                                        'A' + arc4random() % 26,
                                        '0' + arc4random() % 10,
                                        'A' + arc4random() % 26,
                                        '0' + arc4random() % 10];
    
    BNRItem *newItem = [[self alloc] initWithItemName:randomName
                                       valueinDollars:randomValue
                                         serialNumber:randomSerialNumber];
    
    return newItem;
}

- (void)containedItem:(BNRItem *)containedItem
{
    _containedItem = containedItem;
    self.containedItem.container = self;
}

- (NSString *)description
{
    NSString *descriptionString =
     [[NSString alloc] initWithFormat:@"%@ (%@): Worth $%d, recorded on %@",
                        self.itemName,
                        self.serialNumber,
                        self.valueInDollars,
                        self.dateCreated];
    
    return descriptionString;
}

@end

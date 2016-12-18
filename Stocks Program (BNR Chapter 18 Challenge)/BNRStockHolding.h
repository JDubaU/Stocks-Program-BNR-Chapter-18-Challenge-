//
//  BNRStockHolding.h
//  Stocks Program (BNR Chapter 18 Challenge)
//
//  Created by Jake Wojtas on 12/5/16.
//  Copyright (c) 2016 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRStockHolding : NSObject

@property (nonatomic) float purchaseSharePrice;
@property (nonatomic) float currentSharePrice;
@property (nonatomic) int numberOfShares;
@property (nonatomic) NSString *nameOfStock;
@property (nonatomic) NSString *symbol;

/*
 {
 float _purchaseSharePrice;
 float _currentSharePrice;
 int _numberOfShares;
 NSString *_nameOfStock;
 }
 */

/*
 - (float)purchaseSharePrice;
 - (float)currentSharePrice;
 - (int)numberOfShares;
 - (NSString*)nameOfStock;
 - (void)setPurchaseSharePrice:(float)p; //Try to make a longer variable
 - (void)setCurrentSharePrice:(float)c;
 - (void)setNumberOfShares:(int)n;
 - (void)setStockName:(NSString*)s;
 */

- (float)costInDollars; // purchaseSharePrice * numberOfShares
- (float)valueInDollars; // currentSharePrice * numberOfShares


@end

//
//  BNRStockHolding.m
//  Stocks Program (BNR Chapter 18 Challenge)
//
//  Created by Jake Wojtas on 12/5/16.
//  Copyright (c) 2016 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BNRStockHolding.h"

@implementation BNRStockHolding

/*
 - (float)purchaseSharePrice
 {
 return _purchaseSharePrice;
 }
 
 - (float)currentSharePrice
 {
 return _currentSharePrice;
 }
 
 - (int)numberOfShares
 {
 return _numberOfShares;
 }
 
 - (NSString*)nameOfStock
 {
 return _nameOfStock;
 }
 
 - (void)setPurchaseSharePrice:(float)p
 {
 _purchaseSharePrice = p;
 }
 
 - (void)setCurrentSharePrice:(float)c
 {
 _currentSharePrice = c;
 }
 
 - (void)setNumberOfShares:(int)n
 {
 _numberOfShares = n;
 }
 
 - (void)setStockName:(NSString*)s
 {
 _nameOfStock = s;
 }
 */

- (float)costInDollars
{
    return _purchaseSharePrice * _numberOfShares;
}

- (float)valueInDollars
{
    return _currentSharePrice * _numberOfShares;
}


@end
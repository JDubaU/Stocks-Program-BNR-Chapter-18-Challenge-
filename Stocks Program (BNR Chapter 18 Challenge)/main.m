//
//  main.m
//  Stocks Program (BNR Chapter 18 Challenge)
//
//  Created by Jake Wojtas on 12/5/16.
//  Copyright (c) 2016 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRForeignStockHolding.h"
#import "BNRPortfolio.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        //NSDate *now = [[NSDate alloc] init];
        BNRStockHolding *cdkGlobalStock = [[BNRStockHolding alloc] init];
        BNRStockHolding *wixStock = [[BNRStockHolding alloc] init];
        BNRStockHolding *bazzarVoiceStock = [[BNRForeignStockHolding alloc] init];
        BNRStockHolding *googleStock = [[BNRStockHolding alloc] init];
        
        
        /*
         NSString *cdk = @"CDKGlobal";
         NSString *wix = @"Wix";
         NSString *baz = @"BazzarVoice";
         */
        
        //NSString *testString = @"test";
        
        cdkGlobalStock.purchaseSharePrice = 41.29;
        cdkGlobalStock.currentSharePrice = 54.52;
        cdkGlobalStock.numberOfShares = 4;
        cdkGlobalStock.nameOfStock = (@"CDKGlobal");
        
        
        wixStock.purchaseSharePrice = 17.54;
        wixStock.currentSharePrice = 43.75;
        wixStock.numberOfShares = 10;
        wixStock.nameOfStock = (@"Wix");
        
        
        bazzarVoiceStock.purchaseSharePrice = 7.10;
        bazzarVoiceStock.currentSharePrice = 5.74;
        bazzarVoiceStock.numberOfShares = 5;
        bazzarVoiceStock.nameOfStock = (@"BazzarVoice");
        ((BNRForeignStockHolding *)bazzarVoiceStock).conversionRate = 3.88;
        
        googleStock.purchaseSharePrice = 111.2;
        googleStock.currentSharePrice = 96.7;
        googleStock.numberOfShares = 40;
        googleStock.nameOfStock = (@"Google");
        googleStock.symbol = (@"GGL");
        
        //Without properties
        /*
         [cdkGlobalStock setPurchaseSharePrice:41.29];
         [cdkGlobalStock setCurrentSharePrice:54.52];
         [cdkGlobalStock setNumberOfShares:4];
         [cdkGlobalStock setStockName:(@"CDKGlobal")];
         
         [wixStock setPurchaseSharePrice:17.54];
         [wixStock setCurrentSharePrice:43.75];
         [wixStock setNumberOfShares:10];
         [wixStock setStockName:(@"Wix")];
         
         [bazzarVoiceStock setPurchaseSharePrice:7.10];
         [bazzarVoiceStock setCurrentSharePrice:5.74];
         [bazzarVoiceStock setNumberOfShares:5];
         [bazzarVoiceStock setStockName:(@"BazzarVoice")];
         */
        
        /* unused getters
         float purchase1 = [cdkGlobalStock purchaseSharePrice];
         float current1 = [cdkGlobalStock currentSharePrice];
         int num1 = [cdkGlobalStock numberOfShares];
         NSString *stock1 = [cdkGlobalStock nameOfStock];
         
         
         float purchase2 = [wixStock purchaseSharePrice];
         float current2 = [wixStock currentSharePrice];
         int num2 = [wixStock numberOfShares];
         NSString *stock2 = [wixStock nameOfStock];
         
         
         float purchase3 = [bazzarVoiceStock purchaseSharePrice];
         float current3 = [bazzarVoiceStock currentSharePrice];
         int num3 = [bazzarVoiceStock numberOfShares];
         NSString *stock3 = [bazzarVoiceStock nameOfStock];
         */
        
        
        NSMutableArray *stockData = [NSMutableArray array];
        
        [stockData addObject:cdkGlobalStock];
        [stockData addObject:wixStock];
        [stockData addObject:bazzarVoiceStock];
        
        
        for (BNRStockHolding *b in stockData)
        {
            float cost = [b costInDollars];
            float value = [b valueInDollars];
            float profit = value - cost;
            NSString *stock = [b nameOfStock];
            if ([b isMemberOfClass:[BNRForeignStockHolding class]])
            {
                NSLog(@"The cost of %@ is %f zloty", stock, cost);
                NSLog(@"The value of %@  is %f zloty", stock, value);
            }
            else
            {
                NSLog(@"The cost of %@ is $%f", stock, cost);
                NSLog(@"The value of %@  is $%f", stock, value);
            }
            
            if ([b isMemberOfClass:[BNRForeignStockHolding class]])
            {
                if (profit >= 0)
                {
                    NSLog(@"$%f zloty was made from the stock", profit);
                }
                else
                {
                    profit = fabsf(profit);
                    NSLog(@"$%f zloty was lost from the stock", profit);
                }
                
            }
            else
            {
                if (profit >= 0)
                {
                    NSLog(@"$%f was made from the stock", profit);
                }
                else
                {
                    profit = fabsf(profit);
                    NSLog(@"$%f dollars was lost from the stock", profit);
                }
                
            }
        }
        
        BNRPortfolio *portfolio = [[BNRPortfolio alloc] init];
        BNRPortfolio *portfolioForeign = [[BNRPortfolio alloc] init];
        
        [portfolio addStockHolding:cdkGlobalStock];
        [portfolio addStockHolding:wixStock];
        [portfolio addStockHolding:bazzarVoiceStock];
        [portfolio addStockHolding:googleStock];
        //[portfolioForeign addStockHolding:bazzarVoiceStock];
        
        
        float totalDomesticValue = [portfolio valueOfPortfolio];
        float totalForeignValue = [portfolioForeign valueOfPortfolio];
        
        NSLog(@"The value of your domestic portfolio is $%f", totalDomesticValue);
        NSLog(@"The value of your foreign portfolio is %f zloty", totalForeignValue);
        
        float totalValue = totalDomesticValue + (totalForeignValue / 3.88);
        
        NSLog(@"The total value of your portfolio is $%f", totalValue);
        
        
        cdkGlobalStock.symbol = (@"CDK");
        wixStock.symbol = (@"WIX");
        bazzarVoiceStock.symbol = (@"BV");
        
        /*
         NSString *cdkGlobalTicker = [stockData[0] symbol];
         NSString *wixTicker = [stockData[1] symbol];
         NSString *bazzarVoiceTicker = [stockData[2] symbol];
         */
        
        //[portfolio removeStockHolding:wixStock];
        float newTotalDomesticValue = [portfolio valueOfPortfolio];
        NSLog(@"After removing WIX the new value of your domesitc portfolio is $%f", newTotalDomesticValue);
        NSArray *holdings = [portfolio sortHoldings];
        for (NSData *holdingData in holdings)
        {
            NSLog(@"My Holding symbols: %@",[holdingData valueForKey:@"symbol"]);
        }
        holdings = [portfolio topThree];
        //NSArray *symbols = [holdings valueForKey:@"symbol"];
        
        for (NSData *holdingData in holdings)
        {
            NSLog(@"My Holding values: %@", [holdingData valueForKey:@"valueInDollars"]);
        }
        //NSLog(@"My Holdings: %@", [portfolio holdings:]);
        
        
        
        
        
        
        
        
        
        
        /*
         [portfolio objectAtPortfolioLocation:wixStock];
         NSInteger ind = [portfolio objectAtPortfolioLocation:1];
         if (ind != NSNotFound)
         {
         NSLog(@"Object has been successfully removed");
         }
         else
         {
         NSLog(@"Object has not been removed");
         }
         */
        
        
        
        
        
        
        
        /*
         NSDate *later = [[NSDate alloc] init];
         NSTimeInterval timeInterval = [now timeIntervalSinceDate:later];
         float secondsBetween = abs(timeInterval);
         sleep(1);
         NSLog(@"This program took %f seconds to run", secondsBetween);
         */
        
    }
    return 0;
}


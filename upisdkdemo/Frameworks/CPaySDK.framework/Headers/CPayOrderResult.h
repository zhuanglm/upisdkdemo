//
//  CPayResult.h
//  CitconSDK
//
//  Created by Citcon-LZ on 2021/6/22.
//

#import <Foundation/Foundation.h>

@class CPayOrder;

NS_ASSUME_NONNULL_BEGIN

@interface CPayOrderResult : NSObject

@property (nonatomic, retain, readonly) NSString *message;
@property (nonatomic, retain, readonly) NSString *result;
@property (nonatomic, assign, readonly) NSInteger code;
@property (nonatomic, retain, readonly) NSString *transactionId;
@property (nonatomic, retain, readonly) NSString *amount;
@property (nonatomic, retain, readonly) NSString *currency;
@property (nonatomic, retain, readonly) NSString *reference;
@property (nonatomic, retain, readonly) NSString *time;
@property (nonatomic, retain, readonly) CPayOrder *order;
@property (nonatomic, retain, readonly) NSString *country;

@end

NS_ASSUME_NONNULL_END

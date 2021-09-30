//
//  CPayCheckResult.h
//  CitconSDK
//
//  Created by Citcon-LZ on 2021/6/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CPayCheckResult : NSObject

@property (nonatomic, retain, readonly) NSString *transactionId;
@property (nonatomic, retain, readonly) NSString *referenceId;
@property (nonatomic, retain, readonly) NSString *type;
@property (nonatomic, retain, readonly) NSString *amount;
@property (nonatomic, retain, readonly) NSString *currency;
@property (nonatomic, retain, readonly) NSString *time;
@property (nonatomic, retain, readonly) NSString *status;
@property (nonatomic, retain, readonly) NSString *refundStatus;
@property (nonatomic, retain, readonly) NSString *refundAmount;
@property (nonatomic, retain, readonly) NSString *country;
@property (nonatomic, retain, readonly) NSString *message;
@property (nonatomic, assign, readonly) NSInteger code;

@end

NS_ASSUME_NONNULL_END

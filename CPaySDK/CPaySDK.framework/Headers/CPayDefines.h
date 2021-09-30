//
//  CPayDefines.h
//  CitconSDK
//
//  Created by Citcon-LZ on 2021/6/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class CPayOrderResult;
@class CPayCheckResult;
@class CPayConfig;

/// Notification Identifier
static NSString * const kPaymentCompleteNotification = @"Citcon.Payment.Complete.Notification";

/// Completion block
typedef void(^CPayOrderResultBlock)(CPayOrderResult *result);
typedef void(^CPayCheckResultBlock)(CPayCheckResult *result);

typedef void(^CPayConfigResultBlock)(CPayConfig *result);

/// Typedef vendor
typedef enum {
    CPAY_PAYPAL = 0,
    CPAY_CARD,
    CPAY_VENMO,
    
    CPAY_TYPE_MAX,
} CPayType;

/// Typedef running environment
typedef enum {
    CPAY_MODE_DEV = 0,
    CPAY_MODE_QA,
    CPAY_MODE_UAT,
    CPAY_MODE_PROD,
    
    CPAY_MODE_MAX,
} CPayMode;

NS_ASSUME_NONNULL_END

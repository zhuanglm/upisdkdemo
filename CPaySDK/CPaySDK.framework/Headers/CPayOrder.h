//
//  CPayOrder.h
//  CitconSDK
//
//  Created by Citcon-LZ on 2021/6/21.
//

#import <Foundation/Foundation.h>
#import "CPayDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface CPayOrder : NSObject

@property (nonatomic, assign) CPayType methodType;
@property (nonatomic, copy) NSString *chargeToken;
@property (nonatomic, copy) NSString *reference;
@property (nonatomic, copy) NSString *ipnUrl;

#pragma mark - 3DS
@property (nonatomic, assign) BOOL threeDSecureVerification;
@property (nonatomic, copy) NSString *amount;
@property (nonatomic, copy) NSString *email;
/// Billing address
@property (nonatomic, copy) NSString *giveName;
@property (nonatomic, copy) NSString *surName;
@property (nonatomic, copy) NSString *phoneNumber;
@property (nonatomic, copy) NSString *streetAddress;
@property (nonatomic, copy) NSString *extendedAddress;
@property (nonatomic, copy) NSString *locality;
@property (nonatomic, copy) NSString *region;
@property (nonatomic, copy) NSString *postalCode;
@property (nonatomic, copy) NSString *countryCodeAlpha2;

- (NSString *)getPayment;

@end

NS_ASSUME_NONNULL_END

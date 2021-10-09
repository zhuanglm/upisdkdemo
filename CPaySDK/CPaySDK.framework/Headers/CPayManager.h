//
//  CPayManager.h
//  CitconSDK
//
//  Created by Citcon-LZ on 2021/6/21.
//

#import "CPayDefines.h"
#import <UIKit/UIKit.h>

@class CPayOrder;

NS_ASSUME_NONNULL_BEGIN

@interface CPayManager : NSObject

/**
 * Call on application: didFinishLaunchingWithOptions:
 */
+ (void)initSDK;

/**
 * Set up access token
 * @param token The token assgined by Citcon
 */
//+ (void)setupToken:(NSString *)token;

/**
 * Set up environment
 * @param mode The specified environment passed by param. DEV, UAT, PROD
 */
+ (void)setupMode:(CPayMode)mode;

/**
 * Set up access token and customer id
 * @param token The token assgined by Citcon
 * @param customerId The customer id
 */
+ (void)setupToken:(NSString *)token withCustomerId:(NSString *)customerId;

/**
 * Call on application: openURL: options:
 */
+ (void)processOpenURL:(UIApplication *)app url:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options;

+ (void)processOpenURL:(NSSet<UIOpenURLContext *> *)URLContexts API_AVAILABLE(ios(13.0));

/**
 * Request an order with the order object
 * @param order The request order object
 * @param completion The completion callback
 */
+ (void)requestOrder:(CPayOrder *)order completion:(CPayOrderResultBlock)completion;

/**
 * Inquire an order
 * @param transaction_id The transaction id
 * @param completion The completion callback
 */
+ (void)checkOrder:(NSString *)transaction_id completion:(CPayCheckResultBlock)completion;

#pragma mark - TEST
/**
 * NOTE: Just for test
 * Request charge
 */
+ (void)requestCharge:(NSDictionary *)params completion:(void (^)(id result))completion;

/**
 * NOTE: For test
 */
+ (void)getAccessToken:(NSString*)merchant completion:(void (^)(id result))completion;

@end

NS_ASSUME_NONNULL_END

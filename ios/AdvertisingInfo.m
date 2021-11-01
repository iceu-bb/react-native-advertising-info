#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(AdvertisingInfo, NSObject)

RCT_EXTERN_METHOD(getAdvertisingInfo:
                 (RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)

@end

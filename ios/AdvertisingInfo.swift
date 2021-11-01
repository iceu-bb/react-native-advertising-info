import Foundation
import AdSupport
import AppTrackingTransparency

@objc(AdvertisingInfo)
class AdvertisingInfo: NSObject {

    @objc
    static func requiresMainQueueSetup() -> Bool {
        return false
    }
    
    @objc(getAdvertisingInfo:withRejecter:)
    func getAdvertisingInfo(resolve: @escaping RCTPromiseResolveBlock, reject: @escaping RCTPromiseRejectBlock) -> Void {
        if #available(iOS 14, *) {
            ATTrackingManager.requestTrackingAuthorization { status in
                switch status {
                case .authorized:
                    resolve(["status": "Authorized",
                             "advertisingId": ASIdentifierManager.shared().advertisingIdentifier.uuidString,
                             "adTrackingEnabled": true])
                case .denied:
                    resolve(["status": "Denied",
                             "advertisingId": "",
                             "adTrackingEnabled": false])
                case .notDetermined:
                    resolve(["status": "Not Determined",
                             "advertisingId": "",
                             "adTrackingEnabled": false])
                case .restricted:
                    resolve(["status": "Restricted",
                             "advertisingId": "",
                             "adTrackingEnabled": false])
                @unknown default:
                    resolve(["status": "Unknown",
                             "advertisingId": "",
                             "adTrackingEnabled": false])
                }
            }
        }
        else {
            resolve(["status": "Not Required",
                     "advertisingId": ASIdentifierManager.shared().advertisingIdentifier.uuidString,
                     "adTrackingEnabled": true])
        }
    }
}

package com.reactnativeadvertisinginfo;

import androidx.annotation.NonNull;

import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.module.annotations.ReactModule;

import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.WritableMap;
import com.google.android.gms.ads.identifier.AdvertisingIdClient;

@ReactModule(name = AdvertisingInfoModule.NAME)
public class AdvertisingInfoModule extends ReactContextBaseJavaModule {
    public static final String NAME = "AdvertisingInfo";

    public AdvertisingInfoModule(ReactApplicationContext reactContext) {
        super(reactContext);
    }

    @Override
    @NonNull
    public String getName() {
        return NAME;
    }

    @ReactMethod
    public void getAdvertisingInfo(Promise promise) {
        try {
            AdvertisingIdClient.Info adInfo = AdvertisingIdClient.getAdvertisingIdInfo(this.getReactApplicationContext());
            WritableMap res = Arguments.createMap();

            if (adInfo.isLimitAdTrackingEnabled()) {
                res.putString("status", "Denied");
                res.putString("advertisingId", "");
                res.putBoolean("adTrackingEnabled", false);
            } else {
                res.putString("status", "Not required");
                res.putString("advertisingId", adInfo.getId());
                res.putBoolean("adTrackingEnabled", true);
            }
            promise.resolve(res);
        } catch (Exception e) {
            promise.reject(e);
        }
    }

    public static native int getAdvertisingInfo();
}

import * as React from 'react'
import { NativeModules } from 'react-native'

export type TrackingStatus = 'Authorized' | 'Denied' | 'Not Determined' | 'Restricted' | 'Unknown' | 'Not Required'
export type AdvertisingInfo = {
  adTrackingEnabled: boolean
  advertisingId: string
  status: TrackingStatus
}

export const getAdvertisingInfo = (): Promise<AdvertisingInfo> => NativeModules.AdvertisingInfo.getAdvertisingInfo()

export const useAdTrackingInfo = () => {
  const [advertisingInfo, setAdvertisingInfo] = React.useState<AdvertisingInfo | null>(null)

  React.useEffect(() => {
    getAdvertisingInfo()
      .then((adInfo) => setAdvertisingInfo(adInfo))
      .catch((err) => console.log(err))
  }, [])

  return advertisingInfo
}

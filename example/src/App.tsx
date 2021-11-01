import * as React from 'react'
import { StyleSheet, Text, View } from 'react-native'
import { useAdTrackingInfo } from 'react-native-advertising-info'

export default function App() {
  const adInfo = useAdTrackingInfo()

  return (
    <View style={styles.container}>
      <Text style={styles.text}>Result: {JSON.stringify(adInfo, null, 2)}</Text>
    </View>
  )
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
    padding: 24,
  },
  text: {
    fontSize: 22,
  },
})

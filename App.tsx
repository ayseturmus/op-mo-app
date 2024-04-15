import React, {useEffect} from 'react';
import {
  SafeAreaView,
  StyleSheet,
  Image,
  View,
  Text,
  PermissionsAndroid,
  Platform,
} from 'react-native';

import WifiManager from 'react-native-wifi-reborn';

const App: React.FC = () => {
  useEffect(() => {
    const scanWifiNetworks = async () => {
      if (Platform.OS === 'android') {
        const granted = await PermissionsAndroid.request(
          PermissionsAndroid.PERMISSIONS.ACCESS_FINE_LOCATION,
          {
            title: 'Location Access Permission',
            message: 'Location access is required to scan for Wi-Fi networks',
            buttonNeutral: 'Ask Me Later',
            buttonNegative: 'Cancel',
            buttonPositive: 'OK',
          },
        );
        if (granted !== PermissionsAndroid.RESULTS.GRANTED) {
          console.log(
            'Location permission denied, cannot scan for Wi-Fi networks',
          );
          return;
        }
      }

      try {
        const networks = await WifiManager.loadWifiList();
        console.log('Nearby Wi-Fi Networks:', networks);
      } catch (error) {
        console.log('Error scanning Wi-Fi networks:', error);
      }
    };

    scanWifiNetworks();
  }, []);

  return (
    <SafeAreaView style={styles.container}>
      <View style={styles.imageView}>
        <Image
          source={require('./assets/images/octoposprime.png')}
          style={styles.image}
        />
        <Text style={styles.text}>We will be together soon 😉</Text>
      </View>
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'space-between',
    alignItems: 'center',
  },
  imageView: {
    alignItems: 'center',
    flex: 1,
    justifyContent: 'center',
  },
  image: {
    width: 200,
    height: 200,
  },
  text: {
    fontSize: 20,
    fontWeight: 'bold',
    padding: 50,
  },
});

export default App;

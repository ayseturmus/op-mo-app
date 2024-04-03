import React, {useEffect} from 'react'; // Importing React and useEffect together.
import {
  SafeAreaView,
  StyleSheet,
  Image,
  View,
  Text,
  PermissionsAndroid,
  Platform,
} from 'react-native';

import WifiManager from 'react-native-wifi-reborn'; // Importing WifiManager.

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
      {/* You could add the "Scan Wi-Fi Networks" title and functionality here, but we're already calling a function in useEffect. */}
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
  // Additional styling for the Wi-Fi scanning functionality could go here.
});

export default App;

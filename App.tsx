// src/App.tsx
import React from 'react';
import store from './src/redux/store';
import {SafeAreaView, StyleSheet} from 'react-native';
import {PaperProvider} from 'react-native-paper';
import {Provider as StoreProvider} from 'react-redux';
import {ApolloProvider} from '@apollo/client';
import client from './src/services/api/apollo';
import {NavigationContainer} from '@react-navigation/native';
import {createNativeStackNavigator} from '@react-navigation/native-stack';
import LoginScreen from './src/screens/LoginScreen';

const App: React.FC = () => {
  const Stack = createNativeStackNavigator();

  return (
    <NavigationContainer>
      <StoreProvider store={store}>
        <ApolloProvider client={client}>
          <PaperProvider>
            <SafeAreaView style={styles.container}>
              <Stack.Navigator>
                <Stack.Screen
                  name="Login"
                  component={LoginScreen}
                  options={{headerShown: false}}
                />
              </Stack.Navigator>
            </SafeAreaView>
          </PaperProvider>
        </ApolloProvider>
      </StoreProvider>
    </NavigationContainer>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
});

export default App;

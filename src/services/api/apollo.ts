// src/services/api/apollo.ts
import {ApolloClient, InMemoryCache} from '@apollo/client';

const client = new ApolloClient({
  uri: 'http://api.test.octoposprime.com:18080/query',
  cache: new InMemoryCache(),
});

export default client;

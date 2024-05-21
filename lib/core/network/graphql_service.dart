import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GraphQLService {
  final String _url = 'http://api.test.octoposprime.com:18080/query';

  Future<GraphQLClient> _getClient() async {
    final prefs = await SharedPreferences.getInstance();
    final authToken = prefs.getString('authToken');
    
    final HttpLink httpLink = HttpLink(
      _url,
      defaultHeaders: {
        'Authorization': 'Bearer $authToken',
      },
    );

    return GraphQLClient(
      cache: GraphQLCache(store: InMemoryStore()),
      link: httpLink,
    );
  }

  Future<QueryResult> login(String userName, String password) async {
    String loginMutation = r'''
      mutation Login($userName: String!, $password: String!) {
        login(loginRequest: { UserName: $userName, Password: $password }) {
          AuthenticationToken
          RefreshToken
        }
      }
    ''';

    final client = await _getClient();
    final options = MutationOptions(
      document: gql(loginMutation),
      variables: {
        'userName': userName,
        'password': password,
      },
    );

    return await client.mutate(options);
  }

  Future<QueryResult> getUserById(String id) async {
    String userQuery = r'''
      query User($id: ID!) {
        user(Id: $id) {
          Id
          UserName
          Email
          Role
          UserType
          UserStatus
          UserBase {
            Tags
            FirstName
            LastName
          }
        }
      }
    ''';

    final client = await _getClient();
    final options = QueryOptions(
      document: gql(userQuery),
      variables: {
        'id': id,
      },
    );

    return await client.query(options);
  }
}

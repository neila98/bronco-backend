// QuoteDataService is a wrapper class implmenting calls for CRUD operations on Quote endpoints.
//  The class is implemented using the Singleton design pattern.

// : Modify this class accordingly. You want to add all CRUD operations that your app uses.
// Example: get the list of quotes, get a quote for given id, update the like / dislike
//     You may want to refer the past project flutter_todo_rest, you can clone from github:
//         $ git clone https://github.com/jumail-utm/flutter_todo_rest.git

import 'package:bronco2/models/user_model.dart';
import 'package:bronco2/services/rest_service.dart';

class UserDataService {
  //------- Here is how we implement 'Singleton pattern' in Dart --------

  static final UserDataService _instance = UserDataService._constructor();
  factory UserDataService() {
    return _instance;
  }

  UserDataService._constructor();
  final rest = RestService();
  //---------------------------- end of singleton implementation

  // Tho REST calls below, 1) to get all quotes and 2). to delete a quote
  //  are given for examples to guide you writing the other REST calls.

  Future<List<User>> getAllUser() async {
    final listJson = await rest.get('users');

    return (listJson as List)
        .map((itemJson) => User.fromJson(itemJson))
        .toList();
  }

  // You may not need this REST call in your app. It is only for example here.
  Future deleteUser({String email}) async {
    await rest.delete('users/$email');
  }

  // You may not need this REST call in your app. It is only for example here.
  Future<User> createUser({User alluser}) async {
    final json = await rest.post('users', data: alluser);
    return User.fromJson(json);
  }

  // : You may need to provide the REST calls for the followings:
  //        Get a quote for a given id
  Future<User> getUser({String email, User alluser}) async {
    final json = await rest.get('users/$email');
    return User.fromJson(json);
  }

  //        Update a quote for a given id
  Future<User> updateUser({String email, User alluser}) async {
    final json = await rest.patch('users/$email', data: alluser);
    return User.fromJson(json);
  }

  //        Vote a quote for like or dislike

} // class Quote

import 'package:cloud_functions/cloud_functions.dart';

class FirebaseFunctionsService {
  final FirebaseFunctions functions = FirebaseFunctions.instance;

  Future<void> sendEmail({
    required String eventName,
    required String familyName,
    required String familyNameKana,
    required String firstName,
    required String firstNameKana,
    required String email,
    required String phone,
    required int numberOfChildren,
    required String personalMessage,
  }) async {
    try {
      HttpsCallable callable = functions.httpsCallable('sendEmail');
      final response = await callable.call({
        'eventName': eventName,
        'familyName': familyName,
        'familyNameKana': familyNameKana,
        'firstName': firstName,
        'firstNameKana': firstNameKana,
        'email': email,
        'phone': phone,
        'numberOfChildren': numberOfChildren,
        'personalMessage': personalMessage,
      });
      print(response.data);
    } catch (e) {
      print('Error: $e');
    }
  }
}

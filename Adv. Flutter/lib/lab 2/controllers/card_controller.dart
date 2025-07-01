import 'package:project1/lab 2/models/card_model.dart';

class ProfileController {
  CardModel createProfile({
    required String name,
    required String email,
    required String age,
  }) {
    return CardModel(
      name: name,
      email: email,
      age: int.parse(age),
    );
  }
}
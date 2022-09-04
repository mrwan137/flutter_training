

class UserModel {
  static int count = 1;
  var id;
  final String name, phone;

  UserModel({
    required this.name,
    required this.phone
  }) {
    id = count;
    count++;
  }
}
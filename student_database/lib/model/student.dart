class Student {
  static Map<String, dynamic> insertStudent(
      {required String name,
      required String address,
      required String email,
      required String phone}) {
    return {'name': name, 'address': address, 'email': email, 'phone': phone};
  }
}

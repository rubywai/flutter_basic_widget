Future<String> getData() async{
  await Future.delayed(const Duration(seconds: 3));
  return "This is data form server";
  // return Future.error('Error');
}
class Person{
  String? name;
  String? age;
  String? address;
  int? timestamp;
  String? profileUrl;
  Person(this.name,this.age,this.address,this.timestamp,this.profileUrl);

 factory Person.fromMap(Map map){
   return Person(map['name'], map['age'], map['address'],map['timestamp'],
   map['profileUrl']);
  }
  Map<String,dynamic> toMap() =>  {
    'name' : name,
    'age' : age,
    'address' : address,
    'timestamp':timestamp,
    'profileUrl' : profileUrl
  };
}
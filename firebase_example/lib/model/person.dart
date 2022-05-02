class Person{
  String? name;
  String? age;
  String? address;
  int? timestamp;
  Person(this.name,this.age,this.address,this.timestamp);

 factory Person.fromMap(Map map){
   return Person(map['name'], map['age'], map['address'],map['timestamp']);
  }
  Map<String,dynamic> toMap() =>  {
    'name' : name,
    'age' : age,
    'address' : address,
    'timestamp':timestamp
  };
}
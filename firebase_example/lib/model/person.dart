class Person{
  String? name;
  String? age;
  String? address;
  Person(this.name,this.age,this.address);

 factory Person.fromMap(Map map){
   return Person(map['name'], map['age'], map['address']);
  }
  Map<String,dynamic> toMap() =>  {
    'name' : name,
    'age' : age,
    'address' : address
  };
}
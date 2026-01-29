//this will be a model class for the data coming from the db
//the data coming from the db is exposed by the interface IAuthDataSource to the outsiders
//which is in the form of Userdbmodel

import 'package:blog_application/core/models/user_model.dart';

class Userdbmodel extends UserModel {
  Userdbmodel({
    required super.name,
    required super.email,
    required super.data,
    required super.id,
  });

  //ALREADY THE BASE CLASS HAS ALL THE FIELDS AS FINAL,SO WE CANT MODIFY THE EMAIL AS EMAIL NOT PART OF THE JSON
  //ANY WAY IT WILL BE EMPTY.SO WE CANT MODIFY THE EXISTING EMAIL ALSO , TO AVOID THESE
  //SITUATION WE USE THE COPY WITH METHOD. THIS WILL TAKE A USERDBMODEL AS THE PARAMETER AND THEN
  //IT WILL CUSTOMIZE THE CURRENT PARAMETERS AND RETURNS A NEW INSTANCE

  Userdbmodel copywith({
    String? email,
    String? data,
    String? id,
    String? name,
  }) {
    return Userdbmodel(
      name: name ?? this.name,
      data: data ?? this.data,
      email: email ?? this.email,
      id: id ?? this.id,
    );
  }

  factory Userdbmodel.fromjson(Map<String, dynamic> mappings) {
    return Userdbmodel(
      name: mappings['name'] ?? '',
      email: mappings['email'] ?? '',
      data: mappings['data'] ?? '',
      id: mappings['id'] ?? '',
    );
  }
}



/// <---------------------------------------------NOTES---------------------------------------->



//NAMED CONSTRUCTORS AND FACTORY CONSTRUCTORS IN DART 
//GENERALLY, THE CONSTRUCTOR WILL BE LIKE THIS,ABOVE USERDBMODEL THING 
//BUT WE CAN NAME A CONSTRUCTOR IN DART 
//USERDBMODEL.createinstance(params)
//one more is there that is factory constructor 
//this cannot call initialize an instance itself 
//THIS WILL DEPEND ON ANTOHER CONSTRUCTOR TO INITIALIZE THE THINGS 
//FROM JSON CONSTRUCTOR IS AN EXAMPLE OF THIS


//DIFFERENCE BETWEEN [] AND {} 
//IN DART, PARAMETERS CAN BE PUT IN BRACKETS IF [] MEANS OPTIONAL
//{} MEANS THE PARAMETERS ARE OPTIONAL AND IT WILL BE NAME ie ORDER DOES NOT MATTER
//{required} WILL MAKE THE {} NAMED PARAMETERS REQUIRED PARAMETERS
//() if it is not a named means always this will required






//CONSTRUCTOR EXPLAINED
//IF WE HAVE A BASE CLASS AND WE INHERITED FROM SUBCLASS
//THEN WE NEED TO CALL THE BASE CLASS CONSTRUCTOR AND PASS THE PARAMETERS OF THE BASE CLASS, WHEN WE CREATE THE INSTANCE
///EXAMPLE
///class Userdbmodel extends UserModel {
//   String data;
//   Userdbmodel({
//     required String name,
//     required String email,
//     required this.data,
//     required String id,
//   }) : super(data: data, email: email, id: id, name: name) {}
// }

//SAME THING,YOU CAN WRITE AS A SHORT HAND THAT IS SHOWN ABOVE




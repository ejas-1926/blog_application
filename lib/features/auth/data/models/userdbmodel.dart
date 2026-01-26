//this will be a model class for the data coming from the db
//the data coming from the db is exposed by the interface IAuthDataSource to the outsiders
//which is in the form of Userdbmodel

import 'package:blog_application/features/auth/domain/models/user_model.dart';

class Userdbmodel extends UserModel {
  Userdbmodel({
    required super.name,
    required super.data,
    required super.email,
    required super.id,
  });

  //this is a factory constructor
  //this should always return the type Userdbmodel or the subclasses of it
  //factory classes always rely on another constructor to initialize the instance.
  //it cant work alone
  //the name of the factory class must be the name of the immedeately preceeding class
  //you cant simply name as something like x.fromjson like that
  //you can name a constructor in dart any constructor can be named

  factory Userdbmodel.fromjson(Map<String, dynamic> mappings) {
    return Userdbmodel(
      name: mappings["name"].toString(),
      data: mappings["data"],
      email: mappings["email"],
      id: mappings["id"],
    );
  }
}

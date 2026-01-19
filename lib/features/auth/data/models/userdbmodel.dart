

//this will be a model class for the data coming from the db
//the data coming from the db is exposed by the interface IAuthDataSource to the outsiders
//which is in the form of Userdbmodel

class Userdbmodel {

  String name ;
  String password;

  String data;

  Userdbmodel(this.name,this.password,this.data);
}
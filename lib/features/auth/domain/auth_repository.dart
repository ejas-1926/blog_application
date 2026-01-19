import 'package:blog_application/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';
///this will we the repository that is used for sign in up and sign up operations
///when any component in the domain layer requires sign in or sign up it should contact the IAuthRepository interface

abstract interface class IAuthRepository{

  Future<Either<Failure,String>> signup({required String name,required String email,required String password});
  Future<Either<Failure,String>> signin({required String email,required String password});


}

//abstract interface 
//when we do authentication  it can be failure or success
//if its a failure we need to handle this 
//other wise application will crash 
//for this purpose we can use the fpdart package

//Authrepository will handle the authentication functionality
//checks or registers the user


//so when there is a failure we need to do something when there is a success we need to do something 
//but an object can return only one thing 
//for this purpose we use the fpdart package
//this will help to return what data on failure or success case



//All the concretions happen in some other layer 
//but interface which shows the business logic of the application should be in the domain layer 
//other components of application depends only on the interface not on the concrete implementation 
//repository will get data from the data source and send the data to the presentation layers

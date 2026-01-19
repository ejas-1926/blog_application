import 'package:blog_application/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class Usecase<Success,parameters> {
Future<Either<Failure,Success>> call(parameters p);
}

//use case represents a functionality 
//each case must do a work just a functionality
//the output is either a success or failure like that
//in short, Usecase means Just a task
//Usecase represents a task that we need to do 
//the output can be success or failure 
//on success what it gives that depends on the context and on failure what we need to do is 
//something like excaption happens we need to give the failure and show the message why this got failed 
//so we can keep either both of them as generics or one as a failure and show the failed message
//for different use cases the parameter will be different right 
// so what will we do is to create a class with all the parameters required and keep this as the incoming 
//this can also be set as the generic thing so that for different use cases different parameters can be used

import 'package:blog_application/features/auth/domain/usecases/signupusecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  
  final Signupusecase _signupusecase;
  
  
  AuthBloc({required Signupusecase signupusecase}) : _signupusecase = signupusecase,super(AuthInitial()) {

  
    on<AuthSignUpEvent>((event, emit) async{
      
     final respose = await _signupusecase(UserSignUpParameter(email: event.email, name: event.name, password: event.password));
              
     respose.fold((l)=>emit(AuthFailure(l.errormessage)), (r)=>emit(AuthSuccess(r)));
     
     
      //this call funtion has a special meaning in dart
       
      //even if consturctor is different for outside classes we whenever this is put automatically this class will be called

      
    });
  }
}


//auth bloc has three parts event main and the state
//event is something that happens in the application
//like button clicked 
//during different state of sign up process we can show accordingly different states this is in the auth state class
//on authbloc main class handles these events what all events happen like button click what to do we can write in this auth bloc class
//something like the code behind 

//on clicking something some functionlity should work 
//this functionality is represented by the use case something similar to the view model's function
//but this is more of generic functionlity we can say
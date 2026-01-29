import 'package:blog_application/core/models/user_model.dart';
import 'package:blog_application/features/auth/domain/usecases/getcurrentuserusecase.dart';
import 'package:blog_application/features/auth/domain/usecases/signinusecase.dart';
import 'package:blog_application/features/auth/domain/usecases/signupusecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  //private variables are written with _ in dart you can directly use this as in the constructor
  //like generally we will write in the constructor as this._signinusecase,
  // this is not possible in dart inside the constructor
  //you can take in some other instance and then assign it later
  final Signupusecase _signupusecase;
  final Signinusecase _signinusecase;
  final Getcurrentuserusecase _currentuser;

  AuthBloc({
    required Signupusecase signupusecase,
    required Signinusecase signinusecase,
    required Getcurrentuserusecase currentuser,
  }) : _signupusecase = signupusecase,
       _signinusecase = signinusecase,
       _currentuser = currentuser,

       super(AuthInitial()) {
    on<AuthSignUpEvent>((event, emit) async {
      emit(
        AuthLoading(),
      ); //this will emit the auth loading state to all the listeners
      final respose = await _signupusecase(
        UserSignUpParameter(
          email: event.email,
          name: event.name,
          password: event.password,
        ),
      );

      respose.fold(
        (l) => emit(AuthFailure(l.errormessage)),
        (r) => emit(AuthSuccess(r)),
      );

      on<AuthSigninEvent>((event, emit) async {
        emit(AuthLoading());
        //the call function has a special meaning in dart you can just call the class and pass it as the constructor look alike kind of call
        //dart already knows the call method name and it will automatically call this function
        final response = await _signinusecase(
          UserSignInparams(email: event.email, password: event.password),
        );
        response.fold(
          //l represents the failure object
          (l) => emit(AuthFailure(l.errormessage)),
          //r represents the success object
          (r) => emit(AuthSuccess(r)),
        );
      });

      on<isuserloggedin>((event, emit) async {
        emit(AuthLoading());
        var response = await _currentuser(Noparams());
        response.fold(
          (l) => AuthFailure(l.errormessage),
          (r) => AuthSuccess(r),
        );
      });

      ///Bloc has three parts
      ///Bloc ,bloc events, bloc state;
      ///events we are binding to elemets like button and all
      ///whenever something happens based on various conditions such as events or some error we can give the state
      ///state means auth state instances which represents the state/current value
      ///whenever state changes,listeners,builders and consumers are there
      ///which will listen to various events and perform accordingly

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
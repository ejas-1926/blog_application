import 'package:bloc/bloc.dart';
import 'package:blog_application/core/models/user_model.dart';
import 'package:meta/meta.dart';

part 'appuser_state.dart';

class AppuserCubit extends Cubit<AppuserState> {
  AppuserCubit() : super(AppuserInitial());
}



//everything that we do is a feature specific thing

//any models or bloc or something should not come out of the feature specific folder 
//ie no feature part should no depend on another feature folders
//so these kind of things we keep in core 
//so user model also we are moving from the auth feature to core
//because logged in state is a general state state accessed by multiple parts of the program

//each state is an object that represents what is the current state
//just think something similar to the enum representing a value but this is an instance
//based on various events we change the state. this is how bloc works but cubit does not depend on the thing 
//event, directly we can use it 



//just like a fucntion, we are calling it like regular lets say isloggedinornot(); we are calling this to check whether logged in or not 

//EVERY FUNCTION CALL IN A BLOC WE CAN SAY AS AN EVENT,LOGGED IN OR NOT LIKE THAT
//NEVER THINK LIKE UI BASED.THERE IS NO NEED OF SOME UI TO TRIGGER 
//WE ARE JUST CALLING AN EVENT AND CHECK SOMETHING HAPPENNED OR NOT 

//SUPPOSE THERE IS A FEATURE ON APPLICATION 
//THIS WANTS TO NOTIFY THE WHOLE APPLICATION 
//FOR THIS CASE WE WILL DO ONE THING WE WILL JUST CALL T

//when a failure happens we do need to send not only just the string like what error
//we need to send more parameters like error code why this happenned the stack trace etc
//for that we can create a class instead of direct string message
class Failure{
  String errormessage;
  Failure([this.errormessage="Unknown error"]);
}//                    ^
//                     |
//some times we need to send some value 
//but other case may be this is not needed 
//so we need to put a default message for these kind of purposes
//for these kind of optional parameters we need to put in []
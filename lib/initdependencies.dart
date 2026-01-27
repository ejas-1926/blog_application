import 'package:blog_application/core/constants/dbconstants.dart';
import 'package:blog_application/features/auth/data/auth_repoimp.dart';
import 'package:blog_application/features/auth/data/datasource/auth_datasource.dart';
import 'package:blog_application/features/auth/data/datasource/implementation/supabaseclient.dart';
import 'package:blog_application/features/auth/domain/auth_repository.dart';
import 'package:blog_application/features/auth/domain/usecases/signinusecase.dart';
import 'package:blog_application/features/auth/domain/usecases/signupusecase.dart';
import 'package:blog_application/features/auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.asNewInstance();

Future<void> initdependencies() async {
  await registerdb();
  initauth();
}

//cascading operator is used if we want to call the function of an instance sequentially
//instead of writing the full code,we can just write up to the common part and
// then just put .. and call the function
void initauth() {
  serviceLocator
    ..registerFactory<IAuthDataSource>(
      () => SupabaseDataSource(serviceLocator()),
    )
    ..registerFactory<IAuthRepository>(() => AuthRepoimp(serviceLocator()))
    ..registerFactory(() => Signupusecase(authRepository: serviceLocator()))
    ..registerFactory(() => Signinusecase(repository: serviceLocator()))
    ..registerSingleton<AuthBloc>(
      AuthBloc(
        signupusecase: serviceLocator(),
        signinusecase: serviceLocator(),
      ),
    ); //every time no need of creating the auth instance
  //state will get lost otherwise
  //because this will go back to initial state everytime to avoid this we will just add as singelton to retain the state
  //the above comment  is for the last one(Auth bloc)
}

Future<void> registerdb() async {
  final supabase = await Supabase.initialize(
    url: Dbconstants.url,
    anonKey: Dbconstants.anonKey,
  );
  //supabase must be singelton becuase sometimes registration wont happen and results in crashing of the application.

  //this means whenever we want an instance,this will provide new instance
  serviceLocator.registerLazySingleton(() {
    return supabase.client;
  });
}

import 'package:blog_application/core/constants/dbconstants.dart';
import 'package:blog_application/features/auth/data/auth_repoimp.dart';
import 'package:blog_application/features/auth/data/datasource/auth_datasource.dart';
import 'package:blog_application/features/auth/data/datasource/implementation/supabaseclient.dart';
import 'package:blog_application/features/auth/domain/auth_repository.dart';
import 'package:blog_application/features/auth/domain/usecases/signupusecase.dart';
import 'package:blog_application/features/auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.asNewInstance();

Future<void> initdependencies() async {
  await registerdb();
  initauth();
}

void initauth() {
  serviceLocator.registerFactory<IAuthDataSource>(
    () => SupabaseDataSource(serviceLocator()),
  );
  serviceLocator.registerFactory<IAuthRepository>(
    () => AuthRepoimp(serviceLocator()),
  );

  serviceLocator.registerFactory(
    () => Signupusecase(authRepository: serviceLocator()),
  );

  //every time no need of creating the auth instance
  //state will get lost otherwise
  //because this will go back to initial state everytime to avoid this we will just add as singelton to retain the state
  serviceLocator.registerSingleton(
    () => AuthBloc(signupusecase: serviceLocator()),
  );
}

Future<void> registerdb() async {
  final supabase = await Supabase.initialize(
    url: Dbconstants.url,
    anonKey: Dbconstants.anonKey,
  );
  //supabase must be singelton becuase

  //this means whenever we want an instance,this will provide new instance
  serviceLocator.registerLazySingleton(() {
    return supabase.client;
  });
}

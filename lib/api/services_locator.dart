// Using GetIt is a convenient way to provide services and view models
// anywhere we need them in the app.
import 'package:get_it/get_it.dart';
import 'package:my_stackz/api/dio_client.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  serviceLocator.registerLazySingleton<ApiServices>(() => DioClient());
}

abstract class ApiServices {}

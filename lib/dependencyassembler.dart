import 'package:flutter_excellence_hr/services/authentication_services.dart';
import 'package:flutter_excellence_hr/services/login.dart';
import 'package:get_it/get_it.dart';

GetIt dependencyAssembler = GetIt.instance;

void setupDependencyAssembler() {
  dependencyAssembler.registerLazySingleton(() => LoginAuthenticationService());
}

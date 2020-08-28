import 'package:flutter/material.dart';
import 'services/storage_service.dart';
import 'routes.dart';
import 'screens/login_screen.dart';
import 'screens/my_inventory.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/bloc.dart';
import 'services/authentication_services.dart';

void main() => runApp(
        // Injects the Authentication service
        RepositoryProvider<AuthenticationService>(
      create: (context) {
        return LoginAuthenticationService();
      },
      // Injects the Authentication BLoC
      child: BlocProvider<AuthenticationBloc>(
        create: (context) {
          final authService =
              RepositoryProvider.of<AuthenticationService>(context);
          return AuthenticationBloc(authService)..add(AppLoaded());
        },
        child: HrApp(),
      ),
    ));

class HrApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Excellence HR',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      // BlocBuilder will listen to changes in AuthenticationState
      // and build an appropriate widget based on the state.
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          //print(state);
          if (state is AuthenticationAuthenticated) {
            // show home page
            return MyInventory();
          }
          // otherwise show login page
          return LoginScreen();
        },
      ),
      routes: routes,
    );
  }
}

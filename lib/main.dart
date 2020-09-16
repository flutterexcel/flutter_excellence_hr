import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_excellence_hr/screens/attendance/my_attendance.dart';
import 'bloc/bloc.dart';
import 'routes.dart';
import 'screens/screens.dart';
import 'services/authentication_services.dart';
import 'bloc/inventory/inventory.dart';
import 'bloc/profile/profile_bloc.dart';

void main() => runApp(

        // Injects the Authentication service
        RepositoryProvider<AuthenticationService>(
      create: (context) {
        return LoginAuthenticationService();
      },
      // Injects the LoginBloc BLoC
      child: MultiBlocProvider(
        providers: [
          BlocProvider<LoginBloc>(
            create: (context) {
              final authService =
                  RepositoryProvider.of<AuthenticationService>(context);

              return LoginBloc(authService)..add(AppLoad());
            },
          ),
          BlocProvider<InventoryBloc>(
            create: (BuildContext context) => InventoryBloc(InventoryInitial()),
          ),
          BlocProvider<ProfileBloc>(
            create: (BuildContext context) => ProfileBloc(),
          ),
        ],
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

      // BlocBuilder will listen to changes in LoginState
      // and build an appropriate widget based on the state.
      home: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          if (state is CheckAuthenticated) {
            // show home page
            return ShowInventory();
          }
          // otherwise show login page
          return LoginScreen();
        },
      ),
      routes: routes,
    );
  }
}

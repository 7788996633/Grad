import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/my_bloc_observere.dart';
import 'blocs/user_bloc/user_bloc.dart';
import 'blocs/auth_bloc/auth_bloc.dart';

import 'localnotification.dart';
import 'presentation/screens/auth_screens/auth_screen.dart';
import 'presentation/widgets/auth_web_wedgets/auth_web_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();

  if (!kIsWeb) {
    await LocalNotification.init();
    await LocalNotification.ensureConnected();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthBloc()),
          BlocProvider(create: (context) => UserBloc()),
        ],
        child: kIsWeb ? const AuthWebScreen() : const AuthScreen(),
      ),
    );
  }
}

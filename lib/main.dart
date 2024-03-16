import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import 'data/helper/barrel.dart';
import 'data/router/rounter_config.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  runApp(const EntryPoint());
}

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('onClose -- ${bloc.runtimeType}');
  }
}

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  final RouterUtil _routes = RouterUtil();

  @override
  Widget build(BuildContext context) {
    return FlutterSizer(builder: (context, orientation, screenType) {
      return MaterialApp.router(
        routerConfig: _routes.router,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
          useMaterial3: true,
          inputDecorationTheme: InputDecorationTheme(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor, width: 1.5),
              borderRadius: const BorderRadius.all(Radius.circular(32.0)),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 24.0.dp,
              vertical: 18.0.dp,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: cF0f0f0, width: 1.5),
              borderRadius: const BorderRadius.all(Radius.circular(32.0)),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1.5),
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1.5),
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
            ),
          ),
        ),
      );
    });
  }
}

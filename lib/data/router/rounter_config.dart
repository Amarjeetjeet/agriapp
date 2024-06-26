import 'package:agriapp/ui/auth/auth_cubit/auth_cubit.dart';
import 'package:agriapp/ui/auth/login/login_ui.dart';
import 'package:agriapp/ui/auth/password/change_password/change_password_ui.dart';
import 'package:agriapp/ui/auth/password/forgot_password/forgot_password_ui.dart';
import 'package:agriapp/ui/auth/password/otp_ui/otp_ui.dart';
import 'package:agriapp/ui/auth/register/register_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../ui/dashboard/home/home_ui.dart';
import '../../ui/dashboard/notifications/notifications_ui.dart';
import '../../ui/splash/intro_screen.dart';

class RouterUtil {
  static String introScreen = "/intro_screen";
  static String registerUi = "/sign_in";
  static String loginUi = "/login_ui";
  static String forgotPassword = "/forgot_password";
  static String bannerAdsList = "/bannerAdsList";
  static String adsList = "/adsList";
  static String mainScreen = "/main_screen";
  static String otpUi = "/otp_ui";
  static String changePassword = "/change_password";
  static String notificationUi = "/notification_ui";
  static String homeUi = "/home_ui";

  final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: "/",
        name: "/",
        builder: (context, state) => const HomeUi(),
      ),
      GoRoute(
        path: introScreen,
        name: introScreen,
        builder: (context, state) => const IntroScreen(),
      ),
      GoRoute(
        path: registerUi,
        name: registerUi,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: const RegisterUi(),
        ),
      ),
      GoRoute(
        path: loginUi,
        name: loginUi,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: const LoginUi(),
        ),
      ),
      GoRoute(
        path: forgotPassword,
        name: forgotPassword,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: const ForgotPasswordUi(),
        ),
        routes: [
          GoRoute(
            path: "otp_ui",
            name: otpUi,
            builder: (context, state) => const OtpUi(),
          ),
          GoRoute(
            path: "change_password",
            name: changePassword,
            builder: (context, state) => const ChangePasswordUi(),
          ),
        ],
      ),
      GoRoute(
        path: notificationUi,
        name: notificationUi,
        builder: (context, state) => const NotificationsUi(),
      ),
      GoRoute(
        path: homeUi,
        name: homeUi,
        builder: (context, state) => const HomeUi(),
      ),
    ],
  );
}

import 'package:infinityCRM/index.dart';

class AppRoutes {
  static final Map<String, WidgetBuilder> routes = {
    WelcomeScreen.routeName: (context) => WelcomeScreen(),
    Register.routeName: (context) => Register(),
    Login.routeName: (context) => Login(),
    OTP.routeName: (context) => OTP(sceneType: 'creation',),
    ResetPassword.routeName: (context) => ResetPassword(),
    ForgotPassword.routeName: (context) => ForgotPassword(),
    LandingPage.routeName : (context) => LandingPage(),
    LoginPage.routeName : (context) => LoginPage(),
    SignUpPage.routeName : (context) => SignUpPage(),

    DashboardScreen.routeName: (context) => DashboardScreen(),
    Discover.routeName : (context) => Discover(),

    LeadsScreen.routeName: (context) => LeadsScreen(),
    WorkScreen.routeName: (context) => WorkScreen(),
    Chat.routeName : (context) => Chat(),

    ProfileScreen.routeName: (context) => ProfileScreen(),

  };
}

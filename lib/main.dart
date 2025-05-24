import 'package:dopa_fit/core/functions/on_generate_route.dart';
import 'package:dopa_fit/core/functions/shared_preferences.dart';
import 'package:dopa_fit/core/utils/app_styles.dart';
import 'package:dopa_fit/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Prefs.init();
  runApp(const DopaFit());
}
class DopaFit extends StatelessWidget {
  const DopaFit({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: AppStyles.fontFamily,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}
import 'package:dopa_fit/core/cubits/diet_cubit/diet_cubit.dart';
import 'package:dopa_fit/core/cubits/workout_cubit/workout_cubit.dart';
import 'package:dopa_fit/core/functions/on_generate_route.dart';
import 'package:dopa_fit/core/services/get_it_sevices.dart';
import 'package:dopa_fit/core/services/shared_preferences.dart';
import 'package:dopa_fit/core/utils/app_styles.dart';
import 'package:dopa_fit/features/splash/presentation/views/splash_view.dart';
import 'package:dopa_fit/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Prefs.init();
  setupGetIt();
  runApp(const DopaFit());
}

class DopaFit extends StatelessWidget {
  const DopaFit({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => DietCubit()),
            BlocProvider(create: (context) => WorkoutCubit()),
          ],
          child: MaterialApp(
            theme: ThemeData(fontFamily: AppStyles.fontFamily),
            debugShowCheckedModeBanner: false,
            onGenerateRoute: onGenerateRoute,
            initialRoute: SplashView.routeName,
          ),
        );
      }
    );
  }
}

import 'package:dopa_fit/core/cubits/workout_cubit/workout_cubit.dart';
import 'package:dopa_fit/core/functions/on_generate_route.dart';
import 'package:dopa_fit/core/services/custom_observer_bloc.dart';
import 'package:dopa_fit/core/services/get_it_sevices.dart';
import 'package:dopa_fit/core/services/shared_preferences.dart';
import 'package:dopa_fit/core/utils/app_styles.dart';
import 'package:dopa_fit/features/diet/data/models/meal_response_model.dart';
import 'package:dopa_fit/features/diet/data/repos/diet_repo.dart';
import 'package:dopa_fit/features/diet/presentation/manager/cubit/diet_cubit.dart';
import 'package:dopa_fit/features/splash/presentation/views/splash_view.dart';
import 'package:dopa_fit/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dopa_fit/features/diet/data/models/meal_model.dart';
import 'package:dopa_fit/features/diet/data/models/meal_item_model.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await Hive.initFlutter();

  Hive.registerAdapter(MealItemModelAdapter());
  Hive.registerAdapter(MealModelAdapter());
  Hive.registerAdapter(MealResponseModelAdapter());


  await Prefs.init();
  setupGetIt();
  await Hive.openBox<MealResponseModel>('dietBox');
  Bloc.observer = CustomObserverBloc();

  runApp(const DopaFit());
}


class DopaFit extends StatelessWidget {
  const DopaFit({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DietCubit(
          dietRepo: getIt.get<DietRepo>(),
        )),
        BlocProvider(create: (context) => WorkoutCubit()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder:
            (context, child) => MaterialApp(
              theme: ThemeData(
                brightness: Brightness.dark,
                fontFamily: AppStyles.fontFamily,
                scaffoldBackgroundColor: Colors.black,
              ),
              debugShowCheckedModeBanner: false,
              onGenerateRoute: onGenerateRoute,
              initialRoute: SplashView.routeName,
            ),
      ),
    );
  }
}

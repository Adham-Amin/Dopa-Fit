import 'package:dopa_fit/core/cubits/workout_cubit/workout_cubit.dart';
import 'package:dopa_fit/core/functions/launch_link.dart';
import 'package:dopa_fit/core/utils/app_colors.dart';
import 'package:dopa_fit/core/utils/app_styles.dart';
import 'package:dopa_fit/features/diet/presentation/views/diet_view.dart';
import 'package:dopa_fit/features/home/presentation/widgets/custom_home_item.dart';
import 'package:dopa_fit/features/home/presentation/widgets/user_info_and_profile.dart';
import 'package:dopa_fit/features/workout/presentation/views/workout_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             SizedBox(height: 8.h),
            UserInfoAndProfileIcon(),
             SizedBox(height: 32.h),
            BlocBuilder<WorkoutCubit, WorkoutState>(
              builder: (context, state) {
                return CustomHomeItem(
                  onTap: () {
                    launchLink(
                      context,
                      'https://youtube.com/shorts/nrnvNN11adg?si=nwRzcZS3ziUb7X2b',
                    );
                  },
                  title: 'Cardio',
                  image: Text(
                    state is WorkoutLoading
                        ? 'Loading...'
                        : state is WorkoutLoaded
                        ? state.workout.cardio
                        : 'No data',
                    style: AppStyles.textRegular16(
                      context,
                    ),
                  ),
                );
              },
            ),
             SizedBox(height: 8.h),
            CustomHomeItem(
              onTap: () {
                Navigator.pushNamed(context, DietView.routeName);
              },
              title: 'Diet',
              image: Icon(
                Icons.restaurant_outlined,
                color: AppColors.white,
                size: 32.w,
              ),
            ),
            SizedBox(height: 8.h),
            CustomHomeItem(
              onTap: () {
                Navigator.pushNamed(context, WorkoutView.routeName);
              },
              title: 'Workout',
              image: Icon(
                Icons.fitness_center,
                color: AppColors.white,
                size: 32.w,
              ),
            ),
            // SizedBox(height: 8.h),
            // CustomHomeItem(
            //   onTap: () {
            //     Navigator.pushNamed(context, ChatView.routeName);
            //   },
            //   title: 'Chat Bot',
            //   image: Icon(
            //     Icons.chat,
            //     color: AppColors.white,
            //     size: 32.w,
            //   ),
            // ),
             SizedBox(height: 8.h),
            CustomHomeItem(
              onTap: () {
                launchLink(context, 'https://uodiyala.edu.iq/uploads/PDF%20ELIBRARY%20UODIYALA/EL42/Tidy\'s%20Physiotherapy.pdf');
              },
              title: 'Physiotherapy',
              image: Icon(
                Icons.health_and_safety_outlined,
                color: AppColors.white,
                size: 32.w,
              ),
            ),
             SizedBox(height: 8.h),
          ],
        ),
      ),
    );
  }
}
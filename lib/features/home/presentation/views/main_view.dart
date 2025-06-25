import 'package:dopa_fit/features/chat/presentation/pages/chat_view.dart';
import 'package:dopa_fit/features/diet/presentation/views/diet_view.dart';
import 'package:dopa_fit/features/home/presentation/views/home_view.dart';
import 'package:dopa_fit/features/home/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:dopa_fit/features/profile/presentation/views/profile_view.dart';
import 'package:dopa_fit/features/workout/presentation/views/workout_view.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  static const String routeName = '/main';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomeView(),
      WorkoutView(),
      ChatView(),
      DietView(),
      ProfileView(),
    ];

    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: selectedIndex,
        onTap: (index) => setState(() => selectedIndex = index),
      ),
    );
  }
}

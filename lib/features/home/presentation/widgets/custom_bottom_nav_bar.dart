import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final icons = [
      Icons.home,
      Icons.fitness_center,
      Icons.chat_bubble_outline,
      Icons.restaurant,
      Icons.person,
    ];

    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 16.h),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: Colors.white),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(icons.length, (index) {
            final bool isSelected = index == selectedIndex;
            return GestureDetector(
              onTap: () => onTap(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                padding: const EdgeInsets.all(6),
                child: Icon(
                  icons[index],
                  color: isSelected ? Colors.red : Colors.grey,
                  size: isSelected ? 28.w : 24.w,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

import 'package:dopa_fit/core/functions/shared_preferences.dart';
import 'package:dopa_fit/core/utils/app_assets.dart';
import 'package:dopa_fit/core/utils/app_colors.dart';
import 'package:dopa_fit/core/utils/app_styles.dart';
import 'package:dopa_fit/features/auth/presentation/views/login_view.dart';
import 'package:dopa_fit/features/onboarding/presentation/widgets/onboarding_item.dart';
import 'package:flutter/material.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  final PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      children: [
        OnboardingItem(
          onTap: () {
            controller.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn,
            );
          },
          bkgroundImage: AppAssets.imagesBkgroundOnboardingOne,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome To ',
                style: AppStyles.textBold30(
                  context,
                ).copyWith(color: AppColors.white, fontSize: 32),
              ),
              Image.asset(AppAssets.imagesLogo, width: 100),
            ],
          ),
          buttonTitle: 'Next',
          icon: AppAssets.imagesIconArrowRight,
          subtitle: 'Your personal fitness AI Assistant 🤖.',
        ),
        OnboardingItem(
          onTap: () {
            Prefs.setBool('seenOnboarding', true);
            Navigator.pushNamed(context, LoginView.routeName);
          },
          bkgroundImage: AppAssets.imagesBkgroundOnboardingTwo,
          title: Text('Health Metrics &  Fitness Analytics', textAlign: TextAlign.center, style: AppStyles.textBold30(context).copyWith(color: AppColors.white, fontSize: 32)),
          buttonTitle: 'Get Started',
          icon: AppAssets.imagesIconArrowRight,
          subtitle: 'Monitor your health profile with ease 📈.',
        ),
      ],
    );
  }
}
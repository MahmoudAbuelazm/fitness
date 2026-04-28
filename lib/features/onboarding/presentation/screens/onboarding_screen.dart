import 'dart:async';

import 'package:fitness/core/helpers/extinsions.dart';
import 'package:fitness/core/routing/routes.dart';
import 'package:fitness/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool isOut = false;

  final List<Map<String, String>> _onboardingData = [
    {
      'title1': 'Track Your',
      'title2': 'Fitness Journey',
      'subtitle':
          'Monitor your calories, macros, and workouts all in one powerful app',
      'image': 'assets/images/onboarding_1.png',
    },
    {
      'title1': 'Smart Workout',
      'title2': 'Tracking',
      'subtitle':
          'Log sets, reps, and weight with ease. Track your strength progress over time',
      'image': 'assets/images/onboarding_2.png',
    },
    {
      'title1': 'Reach Your Goals',
      'title2': 'Faster',
      'subtitle':
          'Get insights, analytics, and personalized recommendations to accelerate your transformation',
      'image': 'assets/images/onboarding_3.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: _onboardingData.length,
            itemBuilder: (context, index) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    _onboardingData[index]['image']!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Theme.of(
                          context,
                        ).colorScheme.primary.withValues(alpha: 0.3),
                        child: const Center(
                          child: Icon(
                            Icons.image,
                            size: 100,
                            color: Colors.white70,
                          ),
                        ),
                      );
                    },
                  ),
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage(
                          'assets/images/Rectangle 1.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) => FadeTransition(
                      opacity: animation,
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0, 1),
                          end: Offset.zero,
                        ).animate(animation),
                        child: child,
                      ),
                    ),
                    child: Column(
                      key: ValueKey<int>(_currentPage),
                      children: [
                        Text(
                          _onboardingData[_currentPage]['title1']!,
                          style: TextStyles.font36WhiteW700Inter(context),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          _onboardingData[_currentPage]['title2']!,
                          style: TextStyles.font36NeutralGreenW700Inter(
                            context,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 16.h(context)),
                        Text(
                          _onboardingData[_currentPage]['subtitle']!,
                          style: TextStyles.font18WhiteOpacity80W400Inter(
                            context,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 105.h(context)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w(context)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: List.generate(
                            _onboardingData.length,
                            (index) => Container(
                              margin: const EdgeInsets.only(right: 8),
                              width: _currentPage == index ? 24 : 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: _currentPage == index
                                    ? Theme.of(context).colorScheme.primary
                                    : Colors.white.withValues(alpha: 0.5),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() => isOut = true);
                            Timer(const Duration(milliseconds: 300), () {
                              if (_currentPage < 2) {
                                setState(() {
                                  _currentPage++;
                                });
                              } else {
                                // saveOnBoardingState();
                                context.pushNamedAndRemoveUntil(
                                  Routes.goalSelection,
                                );
                              }
                              _pageController.animateToPage(
                                _currentPage,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                              setState(() => isOut = false);
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.primary,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  _currentPage == _onboardingData.length - 1
                                  ? 20
                                  : 32,
                              vertical: 16,
                            ),
                          ),
                          child: _currentPage == _onboardingData.length - 1
                              ? Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                   SvgPicture.asset(
                                     "assets/svgs/start.svg",
                                      
                                    ),
                                    SizedBox(width: 10.w(context)),
                                    Text(
                                      'Start',
                                      style: TextStyles.font16WhiteW700Inter(
                                        context,
                                      ),
                                    ),
                                  ],
                                )
                              : Text(
                                  _currentPage == _onboardingData.length - 1
                                      ? 'Start'
                                      : 'Next',
                                  style: TextStyles.font16WhiteW700Inter(
                                    context,
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 55.h(context)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Future<void> saveOnBoardingState() async {
//   await CacheServices.instance.setOnBoarding(true);
// }

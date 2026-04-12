import 'package:fitness/core/helpers/extensions.dart';
import 'package:fitness/core/routing/routes.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      'title': 'Track Your Fitness Journey',
      'subtitle': 'Keep log of your daily activities, meals, and workouts.',
      'image': 'assets/images/onboarding_1.png',
    },
    {
      'title': 'Smart Workout Tracking',
      'subtitle': 'Personalized insights based on your workout history.',
      'image': 'assets/images/onboarding_2.png',
    },
    {
      'title': 'Reach Your Goals Faster',
      'subtitle': 'Stay consistent with daily reminders and progress tracking.',
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
                        color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
                        child: const Center(
                          child: Icon(Icons.image, size: 100, color: Colors.white70),
                        ),
                      );
                    },
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withValues(alpha: 0.8),
                        ],
                        stops: const [0.4, 1.0],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          SafeArea(
            child: Padding(
               padding: const EdgeInsets.all(24.0),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.end,
                 children: [
                   Text(
                     _onboardingData[_currentPage]['title']!,
                     style: const TextStyle(
                       fontSize: 28,
                       fontWeight: FontWeight.bold,
                       color: Colors.white,
                     ),
                     textAlign: TextAlign.center,
                   ),
                   12.verticalSpace,
                   Text(
                     _onboardingData[_currentPage]['subtitle']!,
                     style: TextStyle(
                       fontSize: 16,
                       color: Colors.white.withValues(alpha: 0.8),
                     ),
                     textAlign: TextAlign.center,
                   ),
                   48.verticalSpace,
                   Row(
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
                           if (_currentPage == _onboardingData.length - 1) {
                             context.pushReplacementNamed(Routes.home);
                           } else {
                             _pageController.nextPage(
                               duration: const Duration(milliseconds: 300),
                               curve: Curves.easeInOut,
                             );
                           }
                         },
                         style: ElevatedButton.styleFrom(
                           backgroundColor: Theme.of(context).colorScheme.primary,
                           foregroundColor: Colors.white,
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(24),
                           ),
                           padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                         ),
                         child: Text(
                           _currentPage == _onboardingData.length - 1 ? 'Get Started' : 'Next',
                           style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                         ),
                       ),
                     ],
                   ),
                 ],
               ),
            ),
          ),
        ],
      ),
    );
  }
}

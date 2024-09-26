import 'package:flutter/material.dart';
import 'package:helping_a_tennis_player/core/utils/app_image.dart';
import 'package:helping_a_tennis_player/features/auth/presentation/views/registration_type_view.dart';
import 'package:helping_a_tennis_player/features/on_boarding_screen/presentation/views/widget/item_page_view.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late PageController pageController;
  int currentPageIndex = 0;

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentPageIndex = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          ItemPageView(
            onPressed: () {
              pageController.animateToPage(
                1,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            },
            image: Assets.imagesBasketballCourt,
            title: 'Follow the tennis court weather',
            subTitle:
                'Is the weather suitable for playing tennis today? Our app gives you the answer instantly by analyzing the weather in your current location.',
            textButton: 'Next',
            currentPageIndex: currentPageIndex,
          ),
          ItemPageView(
            onPressed: () {
              pageController.animateToPage(
                2,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            },
            image: Assets.imagesLocation,
            title: 'Enter your site easily',
            subTitle:
                'All you have to do is enter your geographic location, and the app will provide recommendations tailored to the weather conditions in your area.',
            textButton: 'Next',
            currentPageIndex: currentPageIndex,
          ),
          ItemPageView(
            onPressed: () {
              pageController.animateToPage(
                3,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            },
            image: Assets.imagesAI,
            title: '(AI) at Your Service',
            subTitle:
                'Our app uses artificial intelligence to analyze weather data and provide accurate advice on whether you can get on the pitch.',
            textButton: 'Next',
            currentPageIndex: currentPageIndex,
          ),
          ItemPageView(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const RegistrationTypeView();
              }));
            },
            image: Assets.imagesPlayer,
            title: 'Start playing safely',
            subTitle:
                'With the reliable information provided by our app, you can plan your sports day with comfort and safety.',
            textButton: 'Skip',
            currentPageIndex: currentPageIndex,
          ),
        ],
      ),
    );
  }
}

import 'dart:developer';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:learning_app/global.dart';
import 'package:learning_app/src/app/app.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  PageController pageController = PageController(initialPage: 0);

  void navigateToNextScreen() {
    if (contents.length < 2) {
      navigateToSignin();
    } else {
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void navigateToSignin() {
    Global.storageService.setBool('device_first_open', true);
    log('Device first ${Global.storageService.getDeviceFirstOpen()}');
    Navigator.of(context).pushNamedAndRemoveUntil("loginView", (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      body: BlocBuilder<OnboardingBloc, OnboardingState>(
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: contents.length,
                    onPageChanged: (int index) {
                      state.page = index;
                      BlocProvider.of<OnboardingBloc>(context).add(
                        OnboardingEvent(),
                      );
                    },
                    itemBuilder: (_, index) {
                      var item = contents[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 48,
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 36),
                            Image.asset(
                              item.image,
                              width: 300,
                              height: 300,
                            ),
                            Spacer(),
                            Text(
                              item.title,
                              textAlign: TextAlign.center,
                              style: AppStyles.tsBlackMedium24,
                            ),
                            SizedBox(height: 24),
                            Text(
                              item.description,
                              textAlign: TextAlign.center,
                              style: AppStyles.tsBlackRegular16,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 36),
                DotsIndicator(
                  dotsCount: 3,
                  position: state.page,
                  decorator: DotsDecorator(
                    size: const Size.square(9.0),
                    activeSize: const Size(18.0, 9.0),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                SizedBox(height: 36),
                if (state.page == contents.length - 1)
                  CommonFilledButton(
                    onPressed: navigateToSignin,
                    label: 'Get Started',
                  )
                else
                  SizedBox(
                    height: 52,
                    child: FittedBox(
                      child: FloatingActionButton(
                        elevation: 0,
                        child: Icon(
                          Icons.chevron_right_rounded,
                        ),
                        onPressed: navigateToNextScreen,
                        backgroundColor: Colors.purple,
                      ),
                    ),
                  ),
                SizedBox(height: 42),
                TextButton(
                  onPressed: navigateToSignin,
                  child: Text(
                    state.page == contents.length - 1 ? '' : 'Skip',
                    style: AppStyles.tsBlackMedium16,
                  ),
                ),
                SizedBox(height: 36),
              ],
            ),
          );
        },
      ),
    );
  }
}

class OnBoardingContent {
  String image;
  String title;
  String description;

  OnBoardingContent({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<OnBoardingContent> contents = [
  OnBoardingContent(
    image: AppImages.onboardingImage1,
    title: 'First Learning',
    description: "Mollit nisi nostrud adipisicing commodo eiusmod deserunt in sunt aliquip consectetur ipsum.",
  ),
  OnBoardingContent(
    image: AppImages.onboardingImage2,
    title: 'Second Learning',
    description: 'Mollit nisi nostrud adipisicing commodo eiusmod deserunt in sunt aliquip consectetur ipsum.',
  ),
  OnBoardingContent(
    image: AppImages.onboardingImage3,
    title: 'Third Learning',
    description: 'Mollit nisi nostrud adipisicing commodo eiusmod deserunt in sunt aliquip consectetur ipsum.',
  ),
];

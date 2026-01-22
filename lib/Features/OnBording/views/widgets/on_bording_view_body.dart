import 'package:flutter/material.dart';
import 'package:needit_app/Features/OnBording/views/widgets/on_bording2.dart';
import 'package:needit_app/Features/OnBording/views/widgets/on_bording3.dart';
import 'package:needit_app/Features/OnBording/views/widgets/on_bording4.dart';
import 'package:needit_app/Features/OnBording/views/widgets/onbording1.dart';
import 'package:needit_app/Features/Shopping/view/shopping_view.dart';
import 'package:needit_app/constant.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBordingViewBody extends StatefulWidget {
  const OnBordingViewBody({super.key});

  @override
  State<OnBordingViewBody> createState() => _OnBordingViewBodyState();
}

class _OnBordingViewBodyState extends State<OnBordingViewBody> {
  var onBordingController = PageController();
  bool isLast = false;
  List onBoardingListPages = const [
    Onbording1(),
    Onbording2(),
    Onbording3(),
    Onbording4(),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: PageView.builder(
            physics: const BouncingScrollPhysics(),
            controller: onBordingController,
            onPageChanged: (value) {
              if (value == 2) {
                isLast = true;

                setState(() {});
              } else {
                setState(() {
                  isLast = false;
                });
              }
            },
            itemCount: 3,
            itemBuilder: (context, index) => onBoardingListPages[index],
          ),
        ),
        SmoothPageIndicator(
          controller: onBordingController,
          count: 3,
          effect: const ExpandingDotsEffect(
            dotHeight: 6,
            dotWidth: 6,
            spacing: 3,
            expansionFactor: 3,
            activeDotColor: kprimaryColor,
          ),
        ),
        const SizedBox(height: 37),
        GestureDetector(
          onTap: () {
            if (isLast == true) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const ShoppingView()),
              );
            } else {
              onBordingController.nextPage(
                duration: const Duration(milliseconds: 750),
                curve: Curves.fastLinearToSlowEaseIn,
              );
            }
          },
          child: Container(
            height: 51,
            width: 262,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadiusDirectional.circular(18),
            ),
            child: Center(
              child: Text(
                isLast ? "Get Started" : 'Next',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontFamily: 'swiss',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        !isLast
            ? GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const ShoppingView()),
                );
              },
              child: Column(
                children: [
                  Text(
                    'Skip',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontFamily: 'swiss',
                      color: Colors.black38,
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(
                  //       horizontal: MediaQuery.of(context).size.width * 0.453),
                  //   child: const Divider(
                  //     color: Colors.black,
                  //   ),
                  // )
                ],
              ),
            )
            : const SizedBox(),
        const SizedBox(height: 38),
      ],
    );
  }
}

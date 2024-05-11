import 'package:flutter/material.dart';
import 'package:printing_costs_2/features/home/presentation/views/start_screen.dart';
import 'package:printing_costs_2/srevices/repository.dart';

class SplashViewbody extends StatefulWidget {
  Repository repository;
   SplashViewbody({Key? key,required this.repository}) : super(key: key);

  @override
  _SplashViewbodyState createState() => _SplashViewbodyState();
}

class _SplashViewbodyState extends State<SplashViewbody>
with SingleTickerProviderStateMixin{
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();

    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();

    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Image.asset(AssetsData.image1),
          SizedBox(
            height: 4,
          ),
          // SlidingText(slidingAnimation: slidingAnimation),
        ],
      ),
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
            .animate(animationController);

    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 1),
          () {
        // Get.to(() => const HomeView(),
        //     // calculations
        //     transition: Transition.fade,
        //     duration: kTranstionDuration);

        // GoRouter.of(context).push(AppRouter.kHomeView);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StartScreen(
                  repository: widget.repository,
                ),
              ),
            );
      },
    );
  }




}

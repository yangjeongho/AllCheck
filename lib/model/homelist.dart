import 'package:all_check/design_course/home_design_course.dart';
import 'package:all_check/fitness_app/fitness_app_home_screen.dart';
import 'package:all_check/hotel_booking/hotel_home_screen.dart';
import 'package:all_check/introduction_animation/introduction_animation_screen.dart';
import 'package:flutter/widgets.dart';
import '../custom_drawer/myCheck.dart';
import '../custom_drawer/myUi.dart';
import '../design_course/firebase_login.dart';

class HomeList {
  HomeList({
    this.navigateScreen,
    this.imagePath = '',
  });

  Widget? navigateScreen;
  String imagePath;

  static List<HomeList> homeList = [
    HomeList(
      imagePath: 'assets/introduction_animation/introduction_animation.png',
      navigateScreen: IntroductionAnimationScreen(),
    ),
    HomeList(
      imagePath: 'assets/hotel/hotel_booking.png',
      navigateScreen: HotelHomeScreen(),
    ),
    HomeList(
      imagePath: 'assets/fitness_app/fitness_app.png',
      navigateScreen: FitnessAppHomeScreen(),
    ),
    HomeList(
      imagePath: 'assets/design_course/design_course.png',
      navigateScreen: DesignCourseHomeScreen(),
    ),
    HomeList(
      imagePath: 'assets/design_course/chat.jpg',
      navigateScreen: FirebaseTestScreen(),
    ),
    HomeList(
      imagePath: 'assets/design_course/test.jpg',
      navigateScreen: RiveScreen(),
    ),
  ];
}

import 'package:get/get.dart';
import 'package:news_api/ui/country/view/country_view.dart';
import 'package:news_api/ui/home/view/home_view.dart';
import 'package:news_api/ui/splash/view/splash_view.dart';

const kDefaultTransition = Transition.rightToLeft;
const kDefaultTransitionDuration = Duration(milliseconds: 500);
final getPages = [
  GetPage(
    name: SplashView.name,
    page: () => const SplashView(),
    transition: kDefaultTransition,
    transitionDuration: kDefaultTransitionDuration,
  ),
  GetPage(
    name: HomeView.name,
    page: () => const HomeView(),
    transition: kDefaultTransition,
    transitionDuration: kDefaultTransitionDuration,
  ),
  GetPage(
    name: CountryView.name,
    page: () => CountryView(),
    transition: kDefaultTransition,
    transitionDuration: kDefaultTransitionDuration,
  ),
];

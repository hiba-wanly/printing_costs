import 'package:go_router/go_router.dart';
import 'package:printing_costs_2/features/finance/presentation/views/finance_view.dart';
import 'package:printing_costs_2/features/home/presentation/views/home_view.dart';
import 'package:printing_costs_2/features/materials/presentation/views/material_view.dart';
import 'package:printing_costs_2/features/other/presentation/views/other_view.dart';
import 'package:printing_costs_2/features/printers/presentation/views/printers_view.dart';
import 'package:printing_costs_2/features/setting/pesentations/views/setting_view.dart';
import 'package:printing_costs_2/splash_screen.dart';
import 'package:printing_costs_2/srevices/repository.dart';

abstract class AppRouter{

  static const kHomeView = '/homeView';
  static const kFinance = '/financeView';
  static const kMaterial = '/materialView';
  static const kOther = '/otherView';
  static const kPrinters = '/printerView';
  static const kSetting = '/settingView';
  static const kSplash = '/';
  static const kLogin = '/loginScreen';


  // static final router = GoRouter(
  //   routes: [
  //     GoRoute(
  //         path: '/',
  //       builder: (context,state) =>const  SplashScreen(),
  //     ),
  //     GoRoute(
  //       path: kHomeView,
  //       builder: (context,state) => const HomeView(),
  //     ),
  //     GoRoute(
  //       path: kFinance,
  //       builder: (context,state) => const FinanceView(),
  //     ),
  //     GoRoute(
  //       path: kMaterial,
  //       builder: (context,state) => const MaterialView(),
  //     ),
  //     GoRoute(
  //       path: kOther,
  //       builder: (context,state) => const OtherView(),
  //     ),
  //     GoRoute(
  //       path: kPrinters,
  //       builder: (context,state) => const PrintersView(),
  //     ),
  //     GoRoute(
  //       path: kSetting,
  //       builder: (context,state) => const SettingView(),
  //     ),
  //   ]
  //
  // );

}
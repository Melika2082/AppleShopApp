import 'package:apple_shop/bloc/category/category_bloc.dart';
import 'package:apple_shop/screens/category_screen.dart';
import 'package:apple_shop/screens/profile_screen.dart';
import 'package:apple_shop/screens/home_screen.dart';
import 'package:apple_shop/screens/card_screen.dart';
import 'package:apple_shop/bloc/home/home_bloc.dart';
import 'package:apple_shop/constants/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:apple_shop/di/di.dart';
import 'dart:ui';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getItInite();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedButtomNavigationIndex = 3;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: CustomColors.backgroundScreenColor,
        body: IndexedStack(
          index: selectedButtomNavigationIndex,
          children: getScreens(),
        ),
        bottomNavigationBar: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 40,
              sigmaY: 40,
            ),
            child: BottomNavigationBar(
              onTap: (int index) {
                setState(() {
                  selectedButtomNavigationIndex = index;
                });
              },
              currentIndex: selectedButtomNavigationIndex,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent,
              elevation: 0,
              selectedLabelStyle: const TextStyle(
                fontFamily: 'SB',
                fontSize: 10,
                color: CustomColors.blue,
              ),
              unselectedLabelStyle: const TextStyle(
                fontFamily: 'SB',
                fontSize: 10,
                color: Colors.black,
              ),
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/images/icon_profile.png',
                  ),
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 1,
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: CustomColors.blue,
                            blurRadius: 20,
                            spreadRadius: -7,
                            offset: Offset(0.0, 13.0),
                          ),
                        ],
                      ),
                      child: Image.asset(
                        'assets/images/icon_profile_active.png',
                      ),
                    ),
                  ),
                  label: 'حساب کاربری',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/images/icon_basket.png',
                  ),
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 1),
                    child: Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: CustomColors.blue,
                            blurRadius: 20,
                            spreadRadius: -7,
                            offset: Offset(0.0, 13.0),
                          ),
                        ],
                      ),
                      child: Image.asset(
                        'assets/images/icon_basket_active.png',
                      ),
                    ),
                  ),
                  label: 'سبد خرید',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/images/icon_category.png',
                  ),
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 1),
                    child: Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: CustomColors.blue,
                            blurRadius: 20,
                            spreadRadius: -7,
                            offset: Offset(0.0, 13.0),
                          ),
                        ],
                      ),
                      child: Image.asset(
                        'assets/images/icon_category_active.png',
                      ),
                    ),
                  ),
                  label: 'دسته بندی',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/images/icon_home.png',
                  ),
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 1),
                    child: Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: CustomColors.blue,
                            blurRadius: 20,
                            spreadRadius: -7,
                            offset: Offset(0.0, 13.0),
                          ),
                        ],
                      ),
                      child: Image.asset(
                        'assets/images/icon_home_active.png',
                      ),
                    ),
                  ),
                  label: 'خانه',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> getScreens() {
    return <Widget>[
      const ProfileScreen(),
      const CardScreen(),
      BlocProvider(
        create: (context) => CategoryBloc(),
        child: const CategoryScreen(),
      ),
      Directionality(
        textDirection: TextDirection.rtl,
        child: BlocProvider(
          create: (context) => HomeBloc(),
          child: const HomeScreen(),
        ),
      ),
    ];
  }
}

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:pan_african_ai_summit/ui/events_resgistration/registration_page.dart';
import 'package:pan_african_ai_summit/ui/events_resgistration/widgets/primary_button.dart';
import 'package:pan_african_ai_summit/ui/home_screens/events_page.dart';
import 'package:pan_african_ai_summit/ui/home_screens/main_page.dart';
import 'package:pan_african_ai_summit/ui/home_screens/settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pageController = PageController();
  late final _eventScrollcontroller = ScrollController();
  int _currentPage = 0;
  late final List<Widget> _pages = [
    const MainPage(),
    EventsPage(controller: _eventScrollcontroller),
    const SettingsPage(),
  ];

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
    _eventScrollcontroller.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 14, 92, 0.5),
      extendBody: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actionsPadding: EdgeInsets.only(right: (10)),
        title: Image.asset(
          "assets/images/logo.png",
          filterQuality: FilterQuality.high,
          width: 100,
          height: 100,
        ),
        actions: [
          PrimaryButton(
            text: "Register",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RegistrationPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        key: const PageStorageKey("home_page"),
        scrollDirection: Axis.horizontal,
        controller: _pageController,
        onPageChanged: (value) {
          setState(() {
            _currentPage = value;
          });
        },
        children: _pages,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 50.0, left: 50, right: 50),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: SingleChildScrollView(
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    currentIndex: _currentPage,
                    onTap: (value) {
                      setState(() {
                        _currentPage = value;
                      });
                      _pageController.jumpToPage(value);
                    },
                    backgroundColor: Colors.transparent,
                    unselectedItemColor: Colors.white,
                    selectedItemColor: theme.colorScheme.onPrimary,
                    items: [
                      BottomNavigationBarItem(
                        icon:
                            _currentPage == 0
                                ? _buildIconContainer(icon: Icons.dashboard)
                                : const Icon(Icons.dashboard),
                        label: "",
                      ),
                      BottomNavigationBarItem(
                        icon:
                            _currentPage == 1
                                ? _buildIconContainer(
                                  icon: Icons.calendar_month_rounded,
                                )
                                : const Icon(Icons.calendar_month_rounded),
                        label: "",
                      ),
                      BottomNavigationBarItem(
                        icon:
                            _currentPage == 2
                                ? _buildIconContainer(icon: Icons.settings)
                                : const Icon(Icons.settings),
                        label: "",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildIconContainer({required IconData icon}) {
  return Container(
    decoration: BoxDecoration(color: Color(0xffF561FA), shape: BoxShape.circle),
    alignment: Alignment.center,
    padding: const EdgeInsets.all(10),
    child: Icon(icon),
  );
}

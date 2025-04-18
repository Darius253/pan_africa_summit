import 'package:flutter/material.dart';
import 'package:pan_african_ai_summit/ui/authentication_pages/designate_registration.dart';

class SelectRegistrationType extends StatefulWidget {
  const SelectRegistrationType({super.key});

  @override
  State<SelectRegistrationType> createState() => _SelectRegistrationTypeState();
}

class _SelectRegistrationTypeState extends State<SelectRegistrationType> {
  final List<String> registrationTypes = [
    "Delegate Pass",
    "Media Pass",
    "Volunteer",
  ];

  int _currentIndex = 0;
  final PageController _pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages = [DesignateRegisteration()];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            spacing: 10.0,
            children:
                registrationTypes
                    .map(
                      (type) => GestureDetector(
                        onTap: () {
                          setState(() {
                            _currentIndex = registrationTypes.indexOf(type);

                            // pageController.jumpToPage(currentIndex);
                          });
                        },
                        child: Chip(
                          backgroundColor:
                              _currentIndex == registrationTypes.indexOf(type)
                                  ? theme.colorScheme.primaryContainer
                                  : Colors.transparent,
                          label: Text(
                            type,
                            style: theme.textTheme.bodyLarge?.copyWith(
                              color: theme.colorScheme.onPrimaryContainer,
                            ),
                          ),
                          elevation:
                              _currentIndex == registrationTypes.indexOf(type)
                                  ? 2.0
                                  : 0.0,
                          shadowColor: Colors.black87,
                        ),
                      ),
                    )
                    .toList(),
          ),
        ),
      ),
      body: Stack(
        children: [
          PageView(
            key: PageStorageKey("registration_page"),
            controller: _pageController,
            children: _pages,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

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

  String currentPage = "Delegate";
  int currentIndex = 0;
  final PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

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
                            currentIndex = registrationTypes.indexOf(type);
                            currentPage = type;
                            // pageController.jumpToPage(currentIndex);
                          });
                        },
                        child: Chip(
                          backgroundColor:
                              currentIndex == registrationTypes.indexOf(type)
                                  ? theme.colorScheme.primaryContainer
                                  : Colors.transparent,
                          label: Text(
                            type,
                            style: theme.textTheme.bodyLarge?.copyWith(
                              color: theme.colorScheme.onPrimaryContainer,
                            ),
                          ),
                          elevation: 2.0,
                          shadowColor: Colors.black87,
                        ),
                      ),
                    )
                    .toList(),
          ),
        ),
      ),
    );
  }
}

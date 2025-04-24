import 'package:flutter/material.dart';
import 'package:pan_african_ai_summit/ui/events_resgistration/designate_registration.dart';
import 'package:pan_african_ai_summit/ui/events_resgistration/media_registration.dart';
import 'package:pan_african_ai_summit/ui/events_resgistration/volunteer_registration.dart';

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

  //Media Registration Controllers

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _organisationController = TextEditingController();
  final _designationController = TextEditingController();
  final _mobileNumberController = TextEditingController();
  String? _selectedMediaType;
  String? _selectedCoverageType;
  final _mediaScrollController = ScrollController();

  //Volunteer Registration Controllers
  final _vscrollController = ScrollController();
  String? _selectedAreasOfInterest;

  @override
  void initState() {
    super.initState();
    _pages = [
      const DesignateRegisteration(),
      MediaRegistrationPage(
        firstNameController: _firstNameController,
        lastNameController: _lastNameController,
        emailController: _emailController,
        organisationController: _organisationController,
        designationController: _designationController,
        scrollController: _mediaScrollController,
        mobileNumberController: _mobileNumberController,
        onMediaTypeChanged: (value) {
          setState(() {
            _selectedMediaType = value;
          });
        },
        onCoverageTypeChanged: (value) {
          setState(() {
            _selectedCoverageType = value;
          });
        },
        selectedMediaType: _selectedMediaType,
        selectedCoverageType: _selectedCoverageType,
      ),
      VolunteerRegistrationPage(
        scrollController: _vscrollController,
        firstNameController: _firstNameController,
        lastNameController: _lastNameController,
        emailController: _emailController,
        organisationController: _organisationController,
        designationController: _designationController,
        mobileNumberController: _mobileNumberController,
        onAreasOfInterestChanged: (value) {
          setState(() {
            _selectedMediaType = value;
          });
        },
        selectedAreasOfInterest: _selectedAreasOfInterest,
      ),
    ];
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
    _mediaScrollController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _organisationController.dispose();
    _designationController.dispose();
    _mobileNumberController.dispose();
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
            children:
                registrationTypes
                    .map(
                      (type) => GestureDetector(
                        onTap: () {
                          setState(() {
                            _currentIndex = registrationTypes.indexOf(type);
                            _pageController.jumpToPage(
                              registrationTypes.indexOf(type),
                            );
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
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
                      ),
                    )
                    .toList(),
          ),
        ),
      ),
      body: Stack(
        children: [
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            key: PageStorageKey("registration_page"),
            controller: _pageController,
            children: _pages,

            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pan_african_ai_summit/ui/authentication_pages/designate_registration/contact_information.dart';
import 'package:pan_african_ai_summit/ui/authentication_pages/designate_registration/personal_information.dart';
import 'package:pan_african_ai_summit/ui/authentication_pages/designate_registration/travel_information.dart';
import 'package:pan_african_ai_summit/ui/authentication_pages/widgets/primary_button.dart';
import 'package:pan_african_ai_summit/ui/authentication_pages/widgets/snack_bar.dart';
import 'package:pan_african_ai_summit/ui/onboarding_screens/widgets/nav_button.dart';

class DesignateRegisteration extends StatefulWidget {
  const DesignateRegisteration({super.key});

  @override
  State<DesignateRegisteration> createState() => _DesignateRegisterationState();
}

class _DesignateRegisterationState extends State<DesignateRegisteration> {
  final PageController _pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  int currentIndex = 0;

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _organisationController.dispose();
    _positionController.dispose();
    _pscrollController.dispose();
    _emergencyContactController.dispose();
    _emergencyContactPhoneController.dispose();
    _nationalityController.dispose();
    _countryOfResidenceController.dispose();
    _mobileNumberController.dispose();
    _cscrollController.dispose();
    _travelInformationScrollController.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  //Personal Information Controllers
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _organisationController = TextEditingController();
  final _positionController = TextEditingController();
  final _pscrollController = ScrollController();

  String? _selectedSector;
  String? _selectedGender;

  // Contact Information Controllers
  final _emergencyContactController = TextEditingController();
  final _emergencyContactPhoneController = TextEditingController();
  final _nationalityController = TextEditingController();
  final _countryOfResidenceController = TextEditingController();
  final _mobileNumberController = TextEditingController();
  final _cscrollController = ScrollController();

  // Travel Information Controllers
  final _travelInformationScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      PersonalInformation(
        emailController: _emailController,
        firstNameController: _firstNameController,
        lastNameController: _lastNameController,
        organisationController: _organisationController,
        positionController: _positionController,
        scrollController: _pscrollController,
        onSectorChanged: (val) {
          setState(() {
            _selectedSector = val;
          });
        },
        onGenderChanged: (val) {
          setState(() {
            _selectedGender = val;
          });
        },
        selectedSector: _selectedSector,
        selectedGender: _selectedGender,
      ),
      ContactInformation(
        nationalityController: _nationalityController,
        mobileNumberController: _mobileNumberController,
        countryOfResidenceController: _countryOfResidenceController,
        emergencyContactController: _emergencyContactController,
        emergencyContactPhoneController: _emergencyContactPhoneController,
        scrollController: _cscrollController,
      ),
      TravelInformation(scrollController: _travelInformationScrollController),
    ];
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Stack(
            children: [
              PageView(
                key: Key("DesignateRegistrationPageView"),
                onPageChanged:
                    (value) => setState(() {
                      currentIndex = value;
                    }),
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: pages,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (currentIndex != 0)
                      NavigationButton(
                        icon: Icons.arrow_back,
                        onTap: () {
                          _pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                          setState(() {
                            currentIndex = 0;
                          });
                        },
                      )
                    else
                      const SizedBox(),

                    if (currentIndex != pages.length - 1)
                      NavigationButton(
                        icon: Icons.arrow_forward,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                            setState(() {
                              currentIndex = 1;
                            });
                          } else {
                            CustomSnackBar.show(
                              context,
                              'Please fill in all fields correctly.',
                              isError: true,
                            );
                          }
                        },
                      )
                    else
                      PrimaryButton(
                        onPressed: () {
                          CustomSnackBar.show(
                            context,
                            'Registration Complete successfully.',
                            isError: false,
                          );
                        },
                        text: "Complete",
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pan_african_ai_summit/ui/events_resgistration/registration_page.dart';
import 'package:pan_african_ai_summit/ui/events_resgistration/widgets/primary_button.dart';
import 'package:pan_african_ai_summit/ui/home_screens/widgets/countdown_container.dart';
import 'package:pan_african_ai_summit/ui/home_screens/widgets/events_cover.dart';
import 'package:pan_african_ai_summit/ui/home_screens/widgets/why_paais_info.dart';
import 'package:pan_african_ai_summit/ui/utils/gradient_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();
    final List<Widget> items = [
      const WhyPaaisInfo(
        headline: "Driving African Innovation",
        infoText:
            "The Pan African AI Summit is uniquely positioned to catalyze the development and deployment of AI AI-powered solutions that address Africa’s most pressing challenges. By bringing together the brightest minds from across the continent and the globe, we aim to foster an ecosystem of innovation and collaboration that empowers Africans to lead the way in shaping the future of AI.",
        imagePath: "drive.webp",
      ),
      const WhyPaaisInfo(
        headline: "Promoting Inclusive Growth",
        infoText:
            "We recognize that the benefits of AI must be equitably distributed to ensure that no one is left behind. The Pan African AI Summit is committed to championing policies, initiatives, and partnerships that prioritize the needs of marginalized communities and promote the inclusive development of AI technologies."
            "",
        imagePath: "growth.webp",
      ),
      const WhyPaaisInfo(
        headline: "Bridging the Digital Divide",
        infoText:
            "Africa’s digital transformation is crucial for unlocking the continent’s vast potential. The Pan African AI Summit serves as a platform to bridge the digital divide, fostering collaboration and knowledge exchange that empower African nations to harness the power of emerging technologies, including AI, to drive sustainable development and improve the lives of their citizens."
            "",
        imagePath: "digital.webp",
      ),
    ];

    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 14, 92, 0.5),
      appBar: AppBar(
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
      body: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        controller: controller,
        children: [
          const EventsCover(
            headline: "1st Pan African AI Summit 2025 (PAAIS)",
            subHeadline:
                "Harnessing ai to enhance productivity and skills to drive growth across Africa",
            date: "October 20-22, 2023",
            location: "Accra, Ghana",
          ),

          const CountdownContainer(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: GradientText(
              text: "WHY PAAIS?",
              style: Theme.of(
                context,
              ).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold),
              gradient: LinearGradient(
                colors: [Color(0xffF561FA), Color.fromARGB(255, 203, 6, 52)],
              ),
            ),
          ),
          SizedBox(
            height: 600,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(width: 20),
              itemCount: 3,
              itemBuilder: (context, index) => items[index],
            ),
          ),
        ],
      ),
    );
  }
}

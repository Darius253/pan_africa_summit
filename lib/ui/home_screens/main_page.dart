import 'package:flutter/material.dart';
import 'package:pan_african_ai_summit/ui/home_screens/widgets/countdown_container.dart';
import 'package:pan_african_ai_summit/ui/home_screens/widgets/events_cover.dart';
import 'package:pan_african_ai_summit/ui/home_screens/widgets/why_paais_info.dart';
import 'package:pan_african_ai_summit/ui/utils/gradient_text.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with AutomaticKeepAliveClientMixin {
  final ScrollController _controller = ScrollController();
  bool _isVisible = false;
  late final List<Widget> _items = [
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

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _isVisible = true;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView(
      key: const PageStorageKey<String>("main_page"),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      controller: _controller,
      children: [
        const EventsCover(
          headline: "1st Pan African AI Summit 2025 (PAAIS)",
          subHeadline:
              "Harnessing AI to enhance productivity and skills to drive growth across Africa",
          date: "October 20-22, 2023",
          location: "Accra, Ghana",
        ),

        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
          height: _isVisible ? 150 : 0,
          child: const CountdownContainer(),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: const GradientText(
            text: "WHY PAAIS?",
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
            itemBuilder: (context, index) => _items[index],
          ),
        ),

        const SizedBox(height: 20),
      ],
    );
  }
}

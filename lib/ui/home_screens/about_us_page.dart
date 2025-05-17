import 'package:flutter/material.dart';
import 'package:pan_african_ai_summit/ui/utils/gradient_text.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  bool _isVisible = false;
  final _scrollController = ScrollController();

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
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          controller: _scrollController,
          key: const PageStorageKey("about_us_page"),
          children: [
            AnimatedContainer(
              clipBehavior: Clip.hardEdge,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn,
              height: _isVisible ? 300 : 0,
              width: size.width,
              color: Color(0xFF06004C),
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    const GradientText(
                      text: "ABOUT THE PAN AFRICAN AI SUMMIT",
                      gradient: LinearGradient(
                        colors: [Color(0xff2987F2), Color(0xffF561FA)],
                      ),
                    ),
                    const SizedBox(height: 25),
                    Text(
                      """A transformative initiative bringing together leaders, innovators, and visionaries from across the continent and beyond to shape the future of Artificial Intelligence in Africa.""",
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.left,
                      maxLines: 7,
                    ),
                  ],
                ),
              ),
            ),

            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 40,
              children: [
                SizedBox(height: 20),
                _buildAboutUsTile(
                  theme: theme,
                  header: "About Us",
                  body:
                      "Welcome to the Pan African AI Summit, the premier platform dedicated to fostering innovation, collaboration, and growth within the AI ecosystem across the African continent. Our summit is an annual gathering of visionaries, industry leaders, researchers, and enthusiasts who are passionate about the transformative power of Artificial Intelligence and its potential to drive socio-economic development in Africa.",
                ),

                _buildAboutUsTile(
                  theme: theme,
                  header: "Who Are We?",
                  body:
                      "We are a dynamic team of AI specialists and thought leaders in the UK, Europe, & Africa committed to advancing the AI frontier in the African continent and beyond. With years of experience in technology training and event management, our mission is to create an inclusive and engaging environment where diverse voices can converge to share knowledge, inspire innovation, and forge meaningful partnerships.",
                ),

                _buildAboutUsTile(
                  theme: theme,
                  header: "What We Do",
                  body:
                      "At the Pan African AI Summit, we curate a unique blend of keynote presentations, panel discussions, hands-on workshops, and networking opportunities, all designed to provide valuable insights and foster collaboration. Our events showcase cutting-edge AI research, innovative projects, and practical applications that address the unique challenges and opportunities within the African context.",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildAboutUsTile({
  required ThemeData theme,
  required String header,
  required String body,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          header,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.primary,
          ),
        ),
        Text(
          body,
          textAlign: TextAlign.left,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurface,
          ),
        ),
      ],
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:pan_african_ai_summit/ui/utils/gradient_text.dart';

class RegistrationTypeCard extends StatelessWidget {
  const RegistrationTypeCard({
    super.key,
    required this.title,
    required this.infoText,
    this.description,
  });
  final String title;
  final List<String> infoText;
  final List<String>? description;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(20),
      height: 700,
      width: 350,
      decoration: BoxDecoration(
        color: theme.colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: <Widget>[
          GradientText(
            text: title,
            gradient: LinearGradient(
              colors: [Color.fromARGB(255, 35, 10, 10), Color(0xffF561FA)],
            ),
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            "Application Required",
            style: theme.textTheme.titleLarge?.copyWith(
              color: theme.colorScheme.onSecondaryContainer,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
          Expanded(
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(0),
              itemCount: infoText.length,
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder:
                  (context, index) => _registrationTypeCardInfo(
                    theme,
                    infoText[index].toString(),
                  ),
            ),
          ),
          if (description != null)
            Text(
              "Who Can Apply?",
              style: theme.textTheme.titleLarge!.copyWith(
                color: theme.colorScheme.onSecondaryContainer,
                fontWeight: FontWeight.bold,
              ),
            ),
          if (description != null)
            Expanded(
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(0),
                itemCount: infoText.length,
                separatorBuilder:
                    (context, index) => const SizedBox(height: 10),
                itemBuilder:
                    (context, index) => _registrationTypeCardInfo(
                      theme,
                      description![index].toString(),
                    ),
              ),
            ),
        ],
      ),
    );
  }
}

Widget _registrationTypeCardInfo(ThemeData theme, String infoText) {
  return ListTile(
    contentPadding: const EdgeInsets.symmetric(horizontal: 0),
    leading: Image.asset(
      "assets/images/verify.png",
      height: 30,
      width: 30,
      fit: BoxFit.cover,
    ),
    title: Text(
      infoText,
      style: theme.textTheme.bodyLarge?.copyWith(
        color: theme.colorScheme.onSecondaryContainer,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

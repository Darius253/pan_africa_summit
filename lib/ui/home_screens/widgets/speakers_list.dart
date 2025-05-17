import 'package:flutter/material.dart';
import 'package:pan_african_ai_summit/ui/events_resgistration/widgets/primary_button.dart';
import 'package:pan_african_ai_summit/ui/home_screens/about_speaker_page.dart';
import 'package:pan_african_ai_summit/ui/utils/gradient_text.dart';

class SpeakersList extends StatefulWidget {
  const SpeakersList({super.key});

  @override
  State<SpeakersList> createState() => _SpeakersListState();
}

class _SpeakersListState extends State<SpeakersList> {
  final _scrollController = ScrollController();

  final Map<String, String> _speakerInfo = {
    "name": "Speaker Name",
    "bio":
        "Founder & CEO at DecisiveAI – Former Minister of Digital Transition and Administrative Reform of Morocco",
  };

  final List _speakers = List.generate(20, (index) => '$index');

  void _loadMoreItems() async {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      // Load more items here
      await Future.delayed(const Duration(seconds: 3));
      setState(() {
        _speakers.addAll(List.generate(20, (index) => '$index'));
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_loadMoreItems);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GridView.builder(
      key: const PageStorageKey<String>("speakers"),
      physics: const AlwaysScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        mainAxisExtent: 300,
      ),
      itemBuilder: (_, index) {
        if (index == _speakers.length) {
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(child: CircularProgressIndicator()),
          );
        } else {
          return _buildSpeakersCard(
            theme: theme,
            imageUrl: null,
            name: "${_speakerInfo["name"]!} $index",
            bio: "${_speakerInfo["bio"]!} $index",
            onPressed:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => AboutSpeakerPage(heroTag: "speaker$index"),
                  ),
                ),
            heroTag: "speaker$index",
          );
        }
      },
      controller: _scrollController,
      itemCount: _speakers.length,
      shrinkWrap: true,
    );
  }
}

Widget _buildSpeakersCard({
  required ThemeData theme,
  required String? imageUrl,
  required String name,
  required String bio,
  required Function()? onPressed,
  required String heroTag,
}) {
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      border: Border.all(
        color: theme.colorScheme.onSecondaryContainer,
        width: 2,
      ),
      color: theme.colorScheme.secondaryContainer,
      shape: BoxShape.rectangle,
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 10,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Hero(
          tag: heroTag,
          child: CircleAvatar(radius: 50, backgroundColor: Colors.amber),
        ),
        GradientText(
          text: name,
          style: theme.textTheme.titleLarge?.copyWith(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
          gradient: const LinearGradient(
            colors: [Color(0xff2987F2), Color(0xffF561FA)],
          ),
        ),

        Text(
          bio,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSecondaryContainer,
          ),
          textAlign: TextAlign.center,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        PrimaryButton(text: "View Profile", onPressed: onPressed),
      ],
    ),
  );
}

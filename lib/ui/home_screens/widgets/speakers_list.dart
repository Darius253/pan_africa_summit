import 'package:flutter/material.dart';
import 'package:pan_african_ai_summit/ui/events_resgistration/widgets/primary_button.dart';
import 'package:pan_african_ai_summit/ui/home_screens/about_speaker_page.dart';
import 'package:pan_african_ai_summit/ui/home_screens/events_page/speakers_view_model.dart';
import 'package:pan_african_ai_summit/ui/utils/gradient_text.dart';

class SpeakersList extends StatefulWidget {
  final SpeakersViewModel viewModel;
  const SpeakersList({super.key, required this.viewModel});

  @override
  State<SpeakersList> createState() => _SpeakersListState();
}

class _SpeakersListState extends State<SpeakersList>
    with AutomaticKeepAliveClientMixin {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    if (!widget.viewModel.isLoading && widget.viewModel.speakers.isEmpty) {
      widget.viewModel.fetchSpeakers();
    }
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final theme = Theme.of(context);
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, _) {
        if (widget.viewModel.isLoading) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        if (widget.viewModel.speakers.isEmpty &&
            widget.viewModel.filteredSpeakers.isEmpty) {
          return const Center(child: Text("No speakers available"));
        }
        final speakersToShow =
            widget.viewModel.filteredSpeakers.isNotEmpty
                ? widget.viewModel.filteredSpeakers
                : widget.viewModel.speakers;

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
            final speaker = speakersToShow[index];
            return _buildSpeakersCard(
              theme: theme,
              imageUrl: speaker.imageUrl,
              name: speaker.name,
              bio: speaker.bio,
              onPressed:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => AboutSpeakerPage(
                            heroTag: "speaker$index",
                            imageUrl: speaker.imageUrl,
                            speakerName: speaker.name,
                            bio: speaker.bio,
                          ),
                    ),
                  ),
              heroTag: "speaker$index",
            );
          },

          controller: _scrollController,
          itemCount: speakersToShow.length,
          shrinkWrap: true,
        );
      },
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
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.amber,
            backgroundImage: NetworkImage("$imageUrl"),
          ),
        ),
        GradientText(
          text: name,
          style: theme.textTheme.titleLarge?.copyWith(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
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

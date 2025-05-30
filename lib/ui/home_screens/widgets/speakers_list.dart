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
    _loadSpeakers();
  }

  @override
  bool get wantKeepAlive => true;

  void _loadSpeakers() async {
    await widget.viewModel.fetchSpeakers();
  }

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
            return widget.viewModel.filteredSpeakers.isNotEmpty
                ? _buildSpeakersCard(
                  theme: theme,
                  imageUrl: widget.viewModel.filteredSpeakers[index].imageUrl,
                  name: widget.viewModel.filteredSpeakers[index].name,
                  bio: widget.viewModel.filteredSpeakers[index].bio,
                  onPressed:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => AboutSpeakerPage(
                                heroTag: "speaker$index",
                                imageUrl:
                                    widget
                                        .viewModel
                                        .filteredSpeakers[index]
                                        .imageUrl,
                                speakerName:
                                    widget
                                        .viewModel
                                        .filteredSpeakers[index]
                                        .name,
                                bio:
                                    widget
                                        .viewModel
                                        .filteredSpeakers[index]
                                        .bio,
                              ),
                        ),
                      ),
                  heroTag: "speaker$index",
                )
                : _buildSpeakersCard(
                  theme: theme,
                  imageUrl: widget.viewModel.speakers[index].imageUrl,
                  name: widget.viewModel.speakers[index].name,
                  bio: widget.viewModel.speakers[index].bio,
                  onPressed:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => AboutSpeakerPage(
                                heroTag: "speaker$index",
                                imageUrl:
                                    widget.viewModel.speakers[index].imageUrl,
                                speakerName:
                                    widget.viewModel.speakers[index].name,
                                bio: widget.viewModel.speakers[index].bio,
                              ),
                        ),
                      ),
                  heroTag: "speaker$index",
                );
          },

          controller: _scrollController,
          itemCount:
              widget.viewModel.filteredSpeakers.isNotEmpty
                  ? widget.viewModel.filteredSpeakers.length
                  : widget.viewModel.speakers.length,
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

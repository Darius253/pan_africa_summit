import 'package:flutter/material.dart';
import 'package:pan_african_ai_summit/data/models/speaker_model.dart';
import 'package:pan_african_ai_summit/ui/events_resgistration/widgets/primary_button.dart';
import 'package:pan_african_ai_summit/ui/home_screens/about_speaker_page.dart';
import 'package:pan_african_ai_summit/ui/home_screens/events_page/events_view_model.dart';
import 'package:pan_african_ai_summit/ui/utils/gradient_text.dart';

class SpeakersList extends StatefulWidget {
  const SpeakersList({super.key});

  @override
  State<SpeakersList> createState() => _SpeakersListState();
}

class _SpeakersListState extends State<SpeakersList>
    with AutomaticKeepAliveClientMixin {
  final _scrollController = ScrollController();
  final _viewModel = EventsViewModel();
  List<SpeakerModel> _speakers = [];

  @override
  void initState() {
    super.initState();
    _loadSpeakers();
  }

  @override
  bool get wantKeepAlive => true;

  void _loadSpeakers() async {
    final speakers = await _viewModel.fetchSpeakers();
    setState(() {
      _speakers = speakers;
    });
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
      listenable: _viewModel,
      builder: (context, _) {
        if (_viewModel.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (_speakers.isEmpty) {
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
            return _buildSpeakersCard(
              theme: theme,
              imageUrl: _speakers[index].imageUrl,
              name: _speakers[index].name,
              bio: _speakers[index].bio,
              onPressed:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => AboutSpeakerPage(
                            heroTag: "speaker$index",
                            imageUrl: _speakers[index].imageUrl,
                            speakerName: _speakers[index].name,
                            bio: _speakers[index].bio,
                          ),
                    ),
                  ),
              heroTag: "speaker$index",
            );
          },

          controller: _scrollController,
          itemCount: _speakers.length,
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

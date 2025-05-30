import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pan_african_ai_summit/ui/home_screens/events_page/speakers_view_model.dart';
import 'package:pan_african_ai_summit/ui/utils/gradient_text.dart';

import '../../utils/snack_bar.dart';

class AnimatedListTile extends StatefulWidget {
  const AnimatedListTile({
    super.key,
    required this.text,
    required this.child,
    this.eventDays,
    required this.isAgenda,
    required this.viewModel,
  });
  final String text;
  final Widget child;
  final Widget? eventDays;
  final bool isAgenda;
  final SpeakersViewModel viewModel;

  @override
  State<AnimatedListTile> createState() => _AnimatedListTileState();
}

class _AnimatedListTileState extends State<AnimatedListTile>
    with AutomaticKeepAliveClientMixin {
  bool isRotated = false;
  final _searchController = TextEditingController();
  Timer? _debounce;

  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _toggleRotation() {
    setState(() {
      isRotated = !isRotated;
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      key: const PageStorageKey<String>("animated_list_tile"),
      children: [
        ListTile(
          contentPadding: const EdgeInsets.all(0),
          onTap: _toggleRotation,
          title: GradientText(
            text: widget.text,
            gradient: const LinearGradient(
              colors: [Color(0xffF561FA), Color.fromARGB(255, 203, 6, 52)],
            ),
          ),
          trailing: AnimatedRotation(
            turns: isRotated ? 0.25 : 0,
            duration: const Duration(milliseconds: 300),
            child: const Icon(
              Icons.arrow_forward,
              color: Color.fromARGB(255, 203, 6, 52),
              size: 30,
            ),
          ),
        ),

        if (widget.isAgenda && isRotated) widget.eventDays ?? const SizedBox(),

        if (!widget.isAgenda && isRotated)
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            height: isRotated ? 80 : 0,
            child: _buildSearchField(
              context: context,
              searchController: _searchController,
              onChanged: (value) {
                if (_debounce?.isActive ?? false) _debounce!.cancel();
                _debounce = Timer(const Duration(milliseconds: 300), () {
                  widget.viewModel.searchSpeakers(value);
                });
              },

              onClear: () {
                _searchController.clear();
                widget.viewModel.searchSpeakers("");
                FocusScope.of(context).unfocus();
              },

              onSubmitted: (value) {
                _debounce?.cancel();
                widget.viewModel.searchSpeakers(value);
                FocusScope.of(context).unfocus();
                if (widget.viewModel.filteredSpeakers.isEmpty &&
                        value.isNotEmpty ||
                    widget.viewModel.errorMessage != null) {
                  CustomSnackBar.show(
                    context,
                    'No speakers found for "$value"',
                    isError: true,
                  );
                }
              },
              hintText: "Search For Speaker...",
              hintStyle: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.onPrimary,
              ),
            ),
          ),
        SizedBox(height: 10),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          height: isRotated ? 500 : 0,
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: theme.colorScheme.secondaryContainer,
          ),
          child: isRotated ? widget.child : null,
        ),
      ],
    );
  }
}

TextField _buildSearchField({
  required BuildContext context,
  required TextEditingController searchController,
  required Function(String) onChanged,
  required Function() onClear,
  required String hintText,
  required TextStyle? hintStyle,
  required Function(String) onSubmitted,
}) {
  final theme = Theme.of(context);
  return TextField(
    controller: searchController,
    onChanged: onChanged,
    onSubmitted: onSubmitted,
    maxLength: 28,
    keyboardType: TextInputType.webSearch,
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.only(
        left: 10,
        right: 10.0,
        bottom: 25.0,
        top: 0,
      ),
      suffix:
          searchController.text.isNotEmpty
              ? IconButton(
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
                style: const ButtonStyle(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                icon: const Icon(Icons.cancel_outlined, color: Colors.white),
                onPressed: onClear,
              )
              : SizedBox(),
      hintText: "Search For Speaker...",
      hintStyle: theme.textTheme.titleMedium?.copyWith(color: Colors.white),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: Colors.purpleAccent, width: 1.0),
      ),

      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: Colors.white, width: 1.0),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: Colors.white, width: 1.0),
      ),
    ),
    style: theme.textTheme.titleMedium?.copyWith(color: Colors.white),
  );
}

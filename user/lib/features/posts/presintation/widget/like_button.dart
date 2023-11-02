import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/core/util/extensions/build_context.dart';
import 'package:user/features/app/presentation/widgets/app_elevated_button.dart';
import 'package:user/features/posts/presintation/bloc/home_bloc.dart';

class LikeButton extends StatefulWidget {
  const LikeButton({super.key, required this.isLike, required this.postId});

  final bool isLike;
  final String postId;
  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  late final ValueNotifier<bool> likeNotifier;

  @override
  void initState() {
    likeNotifier = ValueNotifier(widget.isLike);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: likeNotifier,
      builder: (context, obscureValue, _) => MaterialButton(
        onPressed: () {
          if (obscureValue) {
            context.read<HomeBloc>().add(DeleteLikeEvent(widget.postId));
          } else {
            context.read<HomeBloc>().add(AddLikeEvent(widget.postId));
          }
          likeNotifier.value = !obscureValue;
        },
        child: Icon(
          Icons.thumb_up,
          color: obscureValue ? context.colorScheme.primary : Colors.white,
        ),
      ),
    );
  }
}

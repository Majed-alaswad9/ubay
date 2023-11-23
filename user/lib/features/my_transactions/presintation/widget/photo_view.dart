import 'package:flutter/material.dart';

class PhotoView extends StatefulWidget {
  final int maxImages;
  final List<String> imageUrls;

  const PhotoView({required this.imageUrls, this.maxImages = 1, Key? key})
      : super(key: key);

  @override
  createState() => _PhotoViewState();
}

class _PhotoViewState extends State<PhotoView> {
  @override
  Widget build(BuildContext context) {
    if (widget.imageUrls.length == 1) {
      return Image.network(widget.imageUrls[0]);
    } else {
      int remaining = widget.imageUrls.length - widget.maxImages;
      return GestureDetector(
        onTap: () {},
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(widget.imageUrls[0], fit: BoxFit.cover),
            Positioned.fill(
              child: Container(
                alignment: Alignment.center,
                color: Colors.black54,
                child: Text(
                  '+$remaining',
                  style: const TextStyle(fontSize: 32),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}

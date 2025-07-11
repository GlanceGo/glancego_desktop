import 'package:flutter/material.dart';

final class ImageWidget extends StatelessWidget {
  const ImageWidget({
    this.fit = BoxFit.cover,
    this.borderRadius = BorderRadius.zero,
    this.uri,
    this.data,
    this.width,
    this.height,
    this.aspectRatio,
    this.package,
    this.errorBuilder,
    super.key,
  });

  final BoxFit fit;
  final BorderRadius borderRadius;
  final String? uri;
  final UriData? data;
  final double? width;
  final double? height;
  final double? aspectRatio;
  final String? package;
  final Widget Function(
    BuildContext context,
    Object error,
    StackTrace? stackTrace,
  )?
  errorBuilder;

  @override
  Widget build(BuildContext context) {
    if (aspectRatio != null) {
      return AspectRatio(aspectRatio: aspectRatio!, child: _buildImage());
    }

    return _buildImage();
  }

  Widget _buildImage() {
    if (uri == null && data == null) {
      return Placeholder(
        fallbackWidth: width ?? 400,
        fallbackHeight: height ?? 400,
      );
    }

    return ClipRRect(
      borderRadius: borderRadius,
      child: Image(
      //  fit: fit,
        width: width,
        height: height,
        image: _getImage(),
        gaplessPlayback: true,
        errorBuilder: errorBuilder,
      ),
    );
  }

  ImageProvider _getImage() {
    if ((uri?.startsWith('http') ?? false) ||
        (uri?.startsWith('https') ?? false)) {
      return NetworkImage(uri!, headers: {'Access-Control-Allow-Origin': '*'});
    } else if (uri?.startsWith('assets') ?? false) {
      return AssetImage(uri!, package: package);
    } else {
      return MemoryImage(data!.contentAsBytes());
    }
  }
}

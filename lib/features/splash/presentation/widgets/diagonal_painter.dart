import 'package:flutter/material.dart';

/// A custom painter that draws the diagonal shapes for the splash screen.
class DiagonalPainter extends CustomPainter {
  final double animationValue;
  final Color orangeColor;
  final Color whiteColor;

  DiagonalPainter({
    required this.animationValue,
    required this.orangeColor,
    required this.whiteColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..style = PaintingStyle.fill;

    // Draw background (White)
    paint.color = whiteColor;
    canvas.drawRect(Offset.zero & size, paint);

    paint.color = orangeColor;

    // We animate the orange parts to reveal the white center
    // progress 0.0: full orange
    // progress 1.0: small triangles in corners
    
    final double progress = animationValue.clamp(0.0, 1.0);

    // Final Closing Phase
    // At 0.8 to 1.0: the orange triangles grow to cover the screen
    if (progress > 0.8) {
      final double closeProgress = (progress - 0.8) / 0.2;
      
      // Top-Left grows
      final Path topLeftClose = Path();
      topLeftClose.moveTo(0, 0);
      topLeftClose.lineTo(size.width * (0.2 + closeProgress * 0.8), 0);
      topLeftClose.lineTo(0, size.height * (0.2 + closeProgress * 0.8));
      topLeftClose.close();
      canvas.drawPath(topLeftClose, paint);

      // Bottom-Right grows
      final Path bottomRightClose = Path();
      bottomRightClose.moveTo(size.width, size.height);
      bottomRightClose.lineTo(size.width * (0.7 - closeProgress * 0.7), size.height);
      bottomRightClose.lineTo(size.width, size.height * (0.7 - closeProgress * 0.7));
      bottomRightClose.close();
      canvas.drawPath(bottomRightClose, paint);
      
      // Ensure they meet or overlap to cover the center
      if (closeProgress > 0.5) {
          final Path meetingPath = Path();
          meetingPath.moveTo(size.width, 0);
          meetingPath.lineTo(size.width * (1 - closeProgress), 0);
          meetingPath.lineTo(size.width, size.height * closeProgress);
          meetingPath.close();
          canvas.drawPath(meetingPath, paint);
      }
    } else {
      // Top-Left Orange Shape (Reveal Phase)
      final Path topLeftPath = Path();
      topLeftPath.moveTo(0, 0);
      topLeftPath.lineTo(size.width * (1 - progress * 0.8), 0);
      topLeftPath.lineTo(0, size.height * (1 - progress * 0.8));
      topLeftPath.close();
      canvas.drawPath(topLeftPath, paint);

      // Bottom-Right Orange Shape (Reveal Phase)
      if (progress > 0.4) {
        final double brProgress = (progress - 0.4) / 0.4; // normalized for this phase
        final Path bottomRightPath = Path();
        bottomRightPath.moveTo(size.width, size.height);
        bottomRightPath.lineTo(size.width * (1 - brProgress * 0.3), size.height);
        bottomRightPath.lineTo(size.width, size.height * (1 - brProgress * 0.3));
        bottomRightPath.close();
        canvas.drawPath(bottomRightPath, paint);
      } else {
          final Path brInitial = Path();
          brInitial.moveTo(size.width, size.height);
          brInitial.lineTo(size.width, 0);
          brInitial.lineTo(size.width * (1 - progress), size.height);
          brInitial.close();
          canvas.drawPath(brInitial, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant DiagonalPainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}

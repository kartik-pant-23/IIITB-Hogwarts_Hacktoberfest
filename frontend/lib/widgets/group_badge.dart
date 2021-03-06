import 'package:flutter/material.dart';

class GroupBadge extends StatelessWidget {
  final double width;
  final String image;
  GroupBadge({required this.width, required this.image});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: GroupBadgeShadow(),
      child: ClipPath(
        clipper: GroupBadgePath(),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.pink.shade100,
                blurRadius: 8,
                offset: Offset(0, 3),
              ),
            ],
            color: Colors.transparent,
            image: DecorationImage(image: NetworkImage(image), fit: BoxFit.fill)
          ),
          height: width,
          width: width, // Current aspect ratio h:w = 1:1
        ),
      ),
    );
  }
}

class GroupBadgeShadow extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(size.width/10, size.height/10);
    path.quadraticBezierTo(0, size.height/2, size.width/10, size.height*0.65);
    path.arcToPoint(Offset(size.width/2, size.height), radius: Radius.circular(size.height), clockwise: false);
    path.arcToPoint(Offset(size.width*9/10, size.height*0.65), radius: Radius.circular(size.height), clockwise: false);
    path.quadraticBezierTo(size.width, size.height/2, size.width*9/10, size.height/10);
    path.quadraticBezierTo(size.width/2, -1*size.height/10, size.width/10, size.height/10);
    canvas.drawShadow(path, Colors.pink.shade300, 6, false);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class GroupBadgePath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width/10, size.height/10);
    path.quadraticBezierTo(0, size.height/2, size.width/10, size.height*0.65);
    path.arcToPoint(Offset(size.width/2, size.height), radius: Radius.circular(size.height), clockwise: false);
    path.arcToPoint(Offset(size.width*9/10, size.height*0.65), radius: Radius.circular(size.height), clockwise: false);
    path.quadraticBezierTo(size.width, size.height/2, size.width*9/10, size.height/10);
    path.quadraticBezierTo(size.width/2, -1*size.height/10, size.width/10, size.height/10);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
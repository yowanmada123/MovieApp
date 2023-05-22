import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({super.key, required this.heigt, required this.width, required this.imageUrl, required this.containerColor, required this.iconSize, required this.textSize, required this.roundedCorner});
  final double heigt;
  final double width;
  final String imageUrl;
  final Color containerColor;
  final double iconSize;
  final double textSize;
  final double roundedCorner;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(roundedCorner)),
      child: SizedBox(
        width: width,
        height: heigt,
        child: FittedBox(
            fit: BoxFit.cover,
            child: Image.network(imageUrl, fit: BoxFit.cover, errorBuilder: (context, error, stackTrace) {
              return Column(
                children: [
                  Container(
                    height: heigt,
                    color: containerColor,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.warning_rounded,
                          color: Colors.red,
                          size: iconSize,
                        ),
                        Text(
                          'No Available Image',
                          style: TextStyle(fontSize: textSize, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }, loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) return child;
              return SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                ),
              );
            })
            // Image.asset("assets/captain.jpeg"),
            ),
      ),
    );
  }
}

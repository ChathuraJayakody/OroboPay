import 'package:flutter/material.dart';

class FavoriteAvatar extends StatelessWidget {
  final String label;
  final String? imageUrl;
  final IconData? icon;
  final String? countryFlag;
  final VoidCallback? onTap;

  const FavoriteAvatar({
    Key? key,
    required this.label,
    this.imageUrl,
    this.icon,
    this.countryFlag,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: Colors.grey.shade200,
                backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
                child: icon != null && imageUrl == null
                    ? Icon(icon, size: 28)
                    : imageUrl == null && label.isNotEmpty
                        ? Text(
                            label[0],
                            style: Theme.of(context).textTheme.titleLarge,
                          )
                        : null,
              ),
              if (countryFlag != null)
                Positioned(
                  bottom: -2,
                  right: -2,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      countryFlag!,
                      width: 16,
                      height: 16,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Text(label, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}

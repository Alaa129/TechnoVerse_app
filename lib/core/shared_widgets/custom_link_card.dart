import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkCard extends StatelessWidget {
  final String title;
  final String description;
  final String? imageUrl;
  final String linkUrl;

  const LinkCard({
    required this.title,
    required this.description,
    this.imageUrl,
    required this.linkUrl,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () async {
          final Uri url = Uri.parse(linkUrl);
          if (!await launchUrl(url)) {
            throw Exception('Could not launch $linkUrl');
          }
        },
        child: Column(
          children: [
            if (imageUrl != null) // Conditionally show image if available
              Image.asset(
                imageUrl!,
                height: 150,
                width: screenWidth,
                fit: BoxFit.cover,
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                // Use Row for horizontal layout
                children: [
                  if (imageUrl == null) // Show icon only if no image
                    Icon(Icons.link),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(description),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      final Uri url = Uri.parse(linkUrl);
                      if (!await launchUrl(url)) {
                        throw Exception('Could not launch $linkUrl');
                      }
                    },
                    child: Text('Open'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

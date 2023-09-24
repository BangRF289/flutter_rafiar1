import 'package:flutter/material.dart';

import 'detail_image.dart';

class ImageGridView extends StatelessWidget {
  const ImageGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        children: [
          ElevatedButton(
            onPressed: () {
              _showImageBottomSheet(context, 'assets/rice.jpg');
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(2),
            ),
            child: Ink.image(
              image: const AssetImage('assets/rice.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _showImageBottomSheet(context, 'assets/rice.jpg');
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(2),
            ),
            child: Ink.image(
              image: const AssetImage('assets/rice.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _showImageBottomSheet(context, 'assets/rice.jpg');
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(2),
            ),
            child: Ink.image(
              image: const AssetImage('assets/rice.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _showImageBottomSheet(context, 'assets/rice.jpg');
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(2),
            ),
            child: Ink.image(
              image: const AssetImage('assets/rice.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

void _showImageBottomSheet(BuildContext context, String imagePath) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return ShowImage(imagePath: imagePath);
    },
  );
}

class ShowImage extends StatelessWidget {
  final String imagePath;
  const ShowImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Color.fromARGB(255, 10, 255, 231)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset(
              imagePath,
              height: 250,
              width: 250,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            const Text('Apakah Anda ingin melihatnya lebih detail ?'),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailImagePage(imagePath: imagePath),
                      ),
                    );
                  },
                  child: const Text('iya'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('tidak'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

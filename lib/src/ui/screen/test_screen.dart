import 'package:flutter/material.dart';
import 'package:o3d/o3d.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  O3DController controller = O3DController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Test"),
        actions: [
          IconButton(
            onPressed: () => controller.cameraOrbit(20, 20, 5),
            icon: const Icon(Icons.change_circle),
          ),
          IconButton(
            onPressed: () => controller.cameraTarget(1.2, 1, 4),
            icon: const Icon(Icons.change_circle_outlined),
          ),
        ],
      ),
      body: O3D.asset(
        src: "assets/images/intro/intro-bg.webp",
        controller: controller,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_animation/presentation/features/pages/homes/home/components/course_card.dart';
import 'package:flutter_animation/presentation/models/course_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Courses",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            //
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...courses
                      .map((course) => Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: CourseCard(course: course),
                          ))
                      .toList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

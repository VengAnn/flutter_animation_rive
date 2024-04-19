import 'package:flutter/material.dart';
import 'package:flutter_animation/presentation/models/course_model.dart';
import 'package:flutter_svg/svg.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
    super.key,
    required this.course,
  });

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      width: 280,
      height: 260,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0XFF80A4FF),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.title,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                //
                Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 8),
                  child: Text(
                    course.description,
                    style: const TextStyle(
                      color: Colors.white60,
                    ),
                  ),
                ),
                //
                const Text(
                  "61 SECTIONS - 11 HOURS",
                  style: TextStyle(
                    color: Colors.white54,
                  ),
                ),
                //add spacer
                const Spacer(),
                //
                Row(
                  children: List.generate(
                    3,
                    (index) => Transform.translate(
                      offset: Offset((-10 * index).toDouble(), 0),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage(
                          "assets/avaters/Avatar ${index + 1}.jpg",
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SvgPicture.asset(course.iconSrc),
        ],
      ),
    );
  }
}

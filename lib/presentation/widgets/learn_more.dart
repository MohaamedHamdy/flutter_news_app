import 'package:flutter/material.dart';

class LearnMore extends StatelessWidget {
  const LearnMore({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
          ),
          child: Row(
            children: [
              Text(
                'Learn more',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.white,
                    ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.arrow_right_alt,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

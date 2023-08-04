import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nrivzou/core/profile.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(children: [
        const Text(
          "Home",
          style: TextStyle(
              fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        const Spacer(), //space calculated auto
        // CupertinoButton(
        //     color: Colors.teal.shade400,
        //     padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        //     borderRadius: const BorderRadius.all(Radius.circular(90)),
        //     child: const Row(children: [
        //       //const applique 3ala kolchay l de5il
        //       Icon(
        //         Icons.bolt,
        //         size: 18,
        //         color: Colors.black,
        //       ),
        //       SizedBox(
        //         width: 6,
        //       ),
        //       Text(
        //         "Try premium",
        //         style: TextStyle(
        //             color: Colors.black,
        //             fontSize: 16,
        //             fontWeight: FontWeight.bold),
        //       )
        //     ]),
        //     onPressed: () {}),
        const SizedBox(
          width: 4,
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.slider_horizontal_3,
              color: Colors.grey.shade500,
              size: 35,
            )),
        const SizedBox(
          width: 4,
        ),
        InkResponse(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const ProfilePage()));
          },
          child: const CircleAvatar(
            radius: 21,
            backgroundColor: Colors.black87,
            child: CircleAvatar(
              backgroundColor: Colors.indigo,
              radius: 20,
            ),
          ),
        )
      ]),
    );
  }
}

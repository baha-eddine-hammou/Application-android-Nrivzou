import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecommendedLV extends StatelessWidget {
  // const RecommendedLV({super.key});

  final String title; // pour parametrer l widget hethi
  final String desc;
  final String thumbnailURL;

  const RecommendedLV(
      {super.key,
      required this.title,
      required this.desc,
      required this.thumbnailURL}); //constructeur fih l fields mte3na

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      width: MediaQuery.of(context).size.width * .65,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title, // zedneha l parametre
            style: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            desc,
            style: TextStyle(color: Colors.grey.shade600),
            overflow: TextOverflow.ellipsis, // l ... tzidhom
            maxLines: 2,
          ),
          const SizedBox(
            height: 12,
          ),
          Image.asset(
            thumbnailURL,
            // cadre yit7at fih l taswira

            width: double.maxFinite,
            fit: BoxFit
                .cover, // y5alli nafis l ratios w ya3mil preview lil taswira
          )
        ],
      ),
    );
  }
}

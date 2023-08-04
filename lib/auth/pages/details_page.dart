import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nrivzou/models/revision.dart';
import 'package:readmore/readmore.dart';

class DetailsPage extends StatefulWidget {
  final Revision revisionData; // hetheya l objet mte3i

  const DetailsPage(
      {super.key,
      required this.revisionData}); // don't forget this !!!!!!!! anbouba then create const

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      body: SafeArea(
          top: false, // twalli tranparent milfou9
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      // wrapineh b stack l taswira bich n superposiw Awil element howa le5ir fil background
                      widget.revisionData.thumbnailUrl,
                      //height: double.maxFinite,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 30,
                      left: 10,
                      child: InkResponse(
                        // najmou nrapiyouh b positioned w t7tlou top w left values
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.black87,
                          child: Icon(
                            CupertinoIcons.arrow_left_circle_fill,
                            color: Colors.tealAccent.shade100,
                            size: 35,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.revisionData.subject, // zedneha l parametre
                            style: const TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            widget.revisionData.descPreview,
                            style: TextStyle(color: Colors.grey.shade600),
                            overflow: TextOverflow.ellipsis, // l ... tzidhom
                            maxLines: 2,
                          ),
                        ],
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add_box,
                          color: Colors.teal.shade700,
                        ),
                        label: Text("Join ",
                            style: TextStyle(
                              color: Colors.teal.shade700,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ReadMoreText(
                    widget.revisionData.fullDesc,
                    trimLines: 2,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w500),
                    colorClickableText: Colors.pink,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Show less',
                    moreStyle: TextStyle(
                        color: Colors.teal.shade700,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    lessStyle: TextStyle(
                        color: Colors.teal.shade700,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          )),
    );
  }
}

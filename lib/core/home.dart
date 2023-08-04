import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nrivzou/auth/pages/details_page.dart';
import 'package:nrivzou/misc/test_data.dart';
import 'package:nrivzou/widgets/recommended_list.dart';

import '../widgets/app_bars/home_appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TestData tests = TestData();

  // List<String> arrTitles = [
  //   'xxxxx',
  //   'yyyyyyy',
  //   'zzzzzzzz',
  //   'aaaaa',
  //   'bbbbbbbbbb',
  // ];
  // List<String> arrDesc = [
  //   'Ullamco pariatur aliquip consequat cillum pariatur laboris est adipisicing laborum aute. Sint deserunt eiusmod et occaecat magna exercitation non aliquip sint. Culpa enim nulla enim adipisicing ea veniam eiusmod sunt ea duis deserunt. Eiusmod magna dolore adipisicing commodo nostrud consectetur cupidatat quis magna occaecat.',
  //   'Occaecat ullamco cupidatat nostrud ipsum exercitation ipsum commodo fugiat pariatur sit consequat aliquip cillum ut. Tempor est officia qui dolor aliquip pariatur minim excepteur. Ad dolore enim veniam pariatur anim veniam sunt laborum consectetur. Culpa proident non non id. Ut qui anim dolore ipsum culpa veniam laboris. Amet eu laborum laborum ex proident fugiat officia amet nisi velit culpa. Magna mollit cupidatat esse deserunt incididunt qui ad mollit sint irure non labore.',
  //   'Duis deserunt consectetur aliqua nisi aute. Laboris amet non nostrud enim non et reprehenderit ut cupidatat sunt Lorem fugiat. Laboris exercitation culpa excepteur cupidatat velit deserunt sunt minim qui reprehenderit nulla consectetur. Voluptate velit excepteur minim eu. Nulla enim deserunt cupidatat cupidatat mollit in ullamco do est cupidatat commodo nostrud.',
  //   'Commodo aute dolore mollit anim incididunt commodo ad veniam. Nulla mollit cupidatat laborum Lorem consectetur et aliqua et. Excepteur pariatur dolor proident ea incididunt non irure Lorem et veniam amet id. Adipisicing Lorem et sint exercitation est ipsum aute pariatur aliqua aliqua ad laborum. Consectetur eu amet do Lorem reprehenderit pariatur.',
  //   'Id labore veniam officia incididunt eiusmod incididunt reprehenderit ut cillum voluptate. Commodo irure eiusmod anim aliqua adipisicing laboris consectetur ea deserunt occaecat mollit. Quis nulla excepteur nostrud esse in consequat proident cillum minim. Cupidatat laboris esse aute et tempor est in voluptate eu sunt ut minim sunt. Deserunt commodo sint consequat ad ex ut reprehenderit minim in ut laboris ut nostrud.',
  // ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // sar probleme donc we wrepped it
      child: SingleChildScrollView(
        child: Column(
          children: [
            HomeAppbar(), //custom  app bar 3malneha
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 200, //l faza mta3 horizontal scroll
              child: ListView.separated(
                itemCount: tests.revisions.length, //arrTitles.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => DetailsPage(
                              revisionData:tests.revisions[index] ,
                            )));
                  },
                  child: RecommendedLV(
                    // wrapineh bich ywalli clickable
                    // lezimna na3tiw les parametre illi 3malnehom
                    title:
                        tests.revisions[index].subject, // nparcouriw l titles
                    desc: tests.revisions[index].descPreview,
                    thumbnailURL: tests.revisions[index].thumbnailUrl,
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  width: 18,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

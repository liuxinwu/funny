// 父组件状态更新子组件不更新问题  https://www.jianshu.com/p/510c72cecf26

import 'package:flutter/material.dart';
import 'package:funny/utils/iconfont.dart';

class Classify extends StatelessWidget {
  Classify(
      {Key? key,
      required this.currentClassify,
      required this.classifyList,
      required this.setCurrentClassify})
      : super(key: key);

  final List classifyList;
  final Function setCurrentClassify;
  final Map currentClassify;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).primaryColor,
        child: Row(
          children: [
            Expanded(
                child: Scrollbar(
                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.all(8),
                        child: Row(
                          children: classifyList.asMap().entries.map(
                            (entries) {
                              final item = entries.value;
                              return GestureDetector(
                                onTap: () => setCurrentClassify(item),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(8, 0, 8, 5),
                                  child: AnimatedDefaultTextStyle(
                                    duration: Duration(milliseconds: 200),
                                    style: currentClassify['typeId'] ==
                                            item['typeId']
                                        ? TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)
                                        : TextStyle(
                                            fontSize: 16,
                                            color: Colors.white60,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    child: Text(item['typeName']),
                                  ),
                                ),
                              );
                            },
                          ).toList(),
                        )))),
            GestureDetector(
              onTap: () => {print('更多')},
              child: Container(
                width: 33,
                height: 25,
                color: Theme.of(context).primaryColor,
                child: Stack(
                  children: [
                    Positioned(
                        top: -4,
                        right: 3,
                        child: Icon(
                          FIcons.more,
                          size: 25,
                          color: Colors.white70,
                        ))
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

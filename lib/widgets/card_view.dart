import 'package:flutter/material.dart';
import 'package:task_ropstam/model/home_data_model.dart';
import 'package:task_ropstam/utils/text_styles.dart';

class ListCard extends StatelessWidget {
  final HomeDataModel model;
  const ListCard({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        leading: Text(model.id.toString()),
        subtitle: Text("User ID \t ${model.userId}"),
        collapsedBackgroundColor: Colors.grey.shade100,
        title: Text(
          model.title.toString(),
          style: headingNormal,
        ),
        children: <Widget>[
          ListTile(
            title: Text(
              model.body.toString(),
            ),
          )
        ],
      ),
    );
  }
}

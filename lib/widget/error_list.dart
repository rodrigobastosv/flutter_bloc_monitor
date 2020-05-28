import 'package:flutter/material.dart';
import 'package:flutter_bloc_monitor/model/error_info.dart';

class ErrorsList extends StatelessWidget {
  ErrorsList(this.listErrors);

  final List<ErrorInfo> listErrors;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (_, i) => ListTile(
        title: Text('${listErrors[i].bloc}'),
        subtitle:
            Text('${listErrors[i].timestamp.toString().substring(0, 19)}'),
        trailing: InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                scrollable: true,
                title: Text('Stacktrace'),
                content: Text(listErrors[i].stackTrace.toString()),
              ),
            );
          },
          child: Icon(Icons.text_fields),
        ),
      ),
      itemCount: listErrors.length,
    );
  }
}

import 'package:flutter/material.dart';

class ExpansionListView extends StatefulWidget {
  const ExpansionListView({Key? key}) : super(key: key);

  @override
  _ExpansionListViewState createState() => _ExpansionListViewState();
}

class _ExpansionListViewState extends State<ExpansionListView>
    with AutomaticKeepAliveClientMixin {
  List<ExpansionData> myList = [];
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: const Color(0xFF34857b),
      body: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          expansionCallback: (index, isExpanded) {
            myList[index].isOpen = !myList[index].isOpen;
            setState(() {});
          },
          children: myList
              .map(
                (e) => ExpansionPanelRadio(
                  backgroundColor: e.isOpen == true
                      ? const Color(0x0057baae)
                      : const Color(0xFF34857b),
                  value: e.id,
                  canTapOnHeader: true,
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(
                      title: Text(e.title),
                    );
                  },
                  body: const ListTile(
                    title: Text('Item 1 child'),
                    subtitle: Text('Details goes here'),
                  ),
                ),
              )
              .toList(),
        ),
      ),
      floatingActionButton: Transform.scale(
        scale: 1,
        child: FloatingActionButton(
          backgroundColor: Colors.orange.shade400,
          onPressed: () {
            myList.add(
              ExpansionData(false, 'Random Data', myList.length + 1),
            );
            setState(() {});
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class ExpansionData {
  bool isOpen;
  String title;
  Object id;

  ExpansionData(this.isOpen, this.title, this.id);
}

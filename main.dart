import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: events_page(),
  ));
}

class events_page extends StatefulWidget {
  const events_page({Key? key}) : super(key: key);

  @override
  State<events_page> createState() => _events_pageState();
}

class _events_pageState extends State<events_page> {
  List<String> _listoftasks = [];
  String temp = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.home)),
        title: Text('THINGS TO DO'),
        backgroundColor: Color(0xFF810f7c),
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: ListView.builder(
                itemCount: _listoftasks.length,
                itemBuilder: ((context, index) {
                  return Card(
                    color: Color(0xFF810f7c),
                    child: ListTile(
                      title: Text(_listoftasks[index],
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      trailing: Container(
                        width: 70,
                        child: Row(
                          children: [
                            Expanded(
                                child: IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => SimpleDialog(
                                      backgroundColor: Color(0xFF810f7c),
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 10),
                                              child: TextField(
                                                onChanged: (value) {
                                                  setState(() {
                                                    temp = value;
                                                  });
                                                },
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: "click here to edit",
                                                  hintStyle: TextStyle(color: Colors.grey)
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 15),
                                              child: SizedBox(
                                                height:30,
                                                width :10,
                                                child: ElevatedButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        _listoftasks[index] = temp;
                                                        Navigator.pop(context);
                                                      });
                                                    },
                                                    child: Text('Update',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                                  style: ElevatedButton.styleFrom(primary: Colors.purpleAccent.shade700,),

                                                ),
                                              ),
                                            )
                                          ],
                                        ));
                              },
                              icon: Icon(Icons.edit),
                                  color: Colors.white,
                            )),
                            Expanded(
                                child: IconButton(
                              onPressed: () {
                                setState(() {
                                  _listoftasks.removeAt(index);
                                });
                              },
                              icon: Icon(Icons.delete),
                                  color: Colors.white,
                            ))
                          ],
                        ),
                      ),
                    ),
                  );
                })),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String _TextToBeDisplayed = await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => event_adder_page()));
          setState(() {
            _listoftasks.add(_TextToBeDisplayed);
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF810f7c),
      ),
    );
  }
}

class event_adder_page extends StatefulWidget {
  const event_adder_page({Key? key}) : super(key: key);

  @override
  State<event_adder_page> createState() => _event_adder_pageState();
}

class _event_adder_pageState extends State<event_adder_page> {
  final TextEditingController _tec = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.event)),
        title: Text('Add Your Events'),
        backgroundColor: Color(0xFF810f7c),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                height: 80,
                width: 350,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xFF810f7c)),
                child: Padding(
                  padding: const EdgeInsets.all(13),
                  child: TextField(
                    controller: _tec,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.calendar_month,
                          color: Colors.grey,
                        ),
                        hintText: 'ENTER YOUR EVENT',
                        hintStyle: TextStyle(color: Colors.grey)),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            new SizedBox(
                height: 50,
                width: 300,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: ElevatedButton(
                    onPressed: () {
                      String _Eventtext = _tec.text;
                      Navigator.of(context).pop(_Eventtext);
                    },
                    child: Text(
                      'ADD',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF810f7c),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

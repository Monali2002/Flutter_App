import 'package:flutter/material.dart';
import '../services/models/chat_option_list.dart';

class AddPage extends StatefulWidget {
  AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController _textEditingController = TextEditingController();
  List<ChatOptionModel> chatoption = [];
  bool _isTextNotEmpty = false;

  void _getChatOption() {
    chatoption = ChatOptionModel.getChatOption();
  }

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(_updateTextState);
  }

  void _updateTextState() {
    setState(() {
      _isTextNotEmpty = _textEditingController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _getChatOption();
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          _appBar(),
          _optionList(),
          SizedBox(height: 16.0),
          _inputText()
        ],
      ),
    );
  }

  Expanded _optionList() {
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.only(top: 20),
        itemCount: chatoption.length,
        itemBuilder: (BuildContext context, int index) {
          return ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              elevation: 0,
              padding: EdgeInsets.zero,
            ),
            child: ListTile(
              leading: Image.asset(
                chatoption[index].iconpath,
                width: 50,
                height: 50,
              ),
              title: Text(
                chatoption[index].text,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              trailing: const Icon(Icons.arrow_forward),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            SizedBox(height: 20),
      ),
    );
  }

  Container _inputText() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0), // Add padding
      decoration: BoxDecoration(
          color: Colors.white, // Background color
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Colors.black,
            width: 1.0,
          ) // Rounded corners
          ),
      child: TextField(
        controller: _textEditingController,
        decoration: InputDecoration(
          hintText: 'Ask anything...',
          border: InputBorder.none,
          prefixIcon: Icon(Icons.add_circle),
          suffix: buildSuffixIcon(),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text('Ask Me Anything'),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {},
      ),
    );
  }

  Widget buildSuffixIcon() {
    return _textEditingController.text.isEmpty
        ? IconButton(
            icon: Icon(Icons.multitrack_audio),
            onPressed: () {
              // Implement audio recording functionality here
              print('Audio recording pressed');
            },
          )
        : IconButton(
            icon: Icon(
              Icons.arrow_circle_up,
              color: Colors.orangeAccent,
            ),
            onPressed: () {
              // Implement send functionality here
              print('Send button pressed');
            },
          );
  }
}

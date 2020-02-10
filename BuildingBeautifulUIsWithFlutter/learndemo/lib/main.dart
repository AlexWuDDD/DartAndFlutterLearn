import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const String _name = "Alex Wu";

final ThemeData kIOSTheme = new ThemeData(
  primarySwatch: Colors.orange,
  primaryColor: Colors.grey[100],
  primaryColorBrightness: Brightness.light,
);

final ThemeData kDefaultTheme = new ThemeData(
  primarySwatch: Colors.purple,
  accentColor: Colors.orangeAccent[400],
);

void main() => runApp(FriendlycharApp());

class FriendlycharApp extends StatelessWidget {
  const FriendlycharApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Friendlychar",
      theme: defaultTargetPlatform == TargetPlatform.iOS ? kIOSTheme : kDefaultTheme,
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  ChatScreen({Key key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen>  with TickerProviderStateMixin{
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textEditingController = new TextEditingController();
  bool _isComposing = false;

  Widget _buildTextComposer(){
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).accentColor),
      child:new Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child:  TextField(
                controller: this._textEditingController,
                onChanged: (String text){
                  setState(() {
                    this._isComposing = text.length > 0;
                  });
                },
                onSubmitted: this._handleSubmitted,
                decoration: InputDecoration.collapsed(
                  hintText: "Send a message"
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: Theme.of(context).platform == TargetPlatform.iOS?
              CupertinoButton(
                child: Text('Send'),
                onPressed: _isComposing? ()=>this._handleSubmitted(this._textEditingController.text):null,
              ):
              IconButton(
                icon: Icon(Icons.send), 
                onPressed: _isComposing? ()=>this._handleSubmitted(this._textEditingController.text):null,
              ),
            ),
          ],
        ), 
      )
    );
  }

  void _handleSubmitted(String text){
    print(text);
    this._textEditingController.clear();
    setState(() {
      this._isComposing = false;
    });
    ChatMessage message = new ChatMessage(
      text: text,
      animationController: AnimationController(
        duration: Duration(milliseconds: 700),
        vsync: this
      ),
    );
    setState(() {
      this._messages.insert(0, message);
    });
    message.animationController.forward();
  }

  @override
  void dispose() {
    for(ChatMessage message in _messages){
      message.animationController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Friendlychat'),
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            new Flexible(
              child: new ListView.builder(
                padding: EdgeInsets.all(8),
                reverse: true,
                itemBuilder: (context, index){
                  return this._messages[index];
                },
                itemCount: this._messages.length,
              )
            ),
            Divider(height:1),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
              ),
              child:  this._buildTextComposer(),
            ),
          ],
        ),
        decoration: Theme.of(context).platform == TargetPlatform.iOS?
          BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.orangeAccent
              )
            ),
          ):
          null,
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final AnimationController animationController;
  ChatMessage({this.text, this.animationController});

  @override
  Widget build(BuildContext context) {
    return new SizeTransition(
      sizeFactor: CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOutCirc
      ),
      axisAlignment: 0,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(right:16),
              child: CircleAvatar(child: new Text(_name[0])),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(_name, style: Theme.of(context).textTheme.subhead,),
                  Container(
                    margin: const EdgeInsets.only(top:5),
                    child: new Text(text),
                  ),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}
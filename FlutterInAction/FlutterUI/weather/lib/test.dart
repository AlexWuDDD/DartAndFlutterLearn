import 'package:flutter/material.dart';

List<String> list = ['tab1', 'tab2', 'tab3', 'tab4', 'tab5'];

Function MyonTapChange(int index){
  print('Change to $index');
}

class City{
  String name;
  bool checked;

  City(this.name, {this.checked = false});
}

List<City> allAddedCities = [
  City("Portland"),
  City("Berlin"), 
  City("Buenos Aires"), 
  City("Chaing Mai"), 
  City("Eugene"), 
  City("Georgetown"), 
  City("London"),
  City("New York"), 
  City("Panama City"), 
  City("San Francisco"), 
  City("Tokyo"), 
];


class Test extends StatelessWidget {
  const Test({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //return PaddingDemo();
    //return TabBarDemo(tabItems: list, onTabChange: MyonTapChange, startIndex: 0,);
    //return GestureDemo2();
    return FormsDemo();
  }
}

class FormsDemo extends StatefulWidget {
  FormsDemo({Key key}) : super(key: key);

  @override
  _FormsDemoState createState() => _FormsDemoState();
}

class _FormsDemoState extends State<FormsDemo> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add City'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    helperText: "Required",
                    labelText: "City name",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    helperText: "Optional",
                    labelText: "State or Territory name",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: DropdownButtonFormField(
                  items: <DropdownMenuItem>[], 
                  onChanged: (value) {},
                ),
              ),
              FormField(
                builder: (context){
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Default city?"),
                      Checkbox(
                        value: false, 
                        onChanged: (val){}
                      )
                    ],
                  );
                },
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: FlatButton(
                      textColor: Colors.red[400],
                      onPressed: (){}, 
                      child: Text('Cancel')
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: RaisedButton(
                      textColor: Colors.red[400],
                      onPressed: (){}, 
                      child: Text('Submit')
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

    );
  }
}


class GestureDemo extends StatelessWidget {
  const GestureDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child:GestureDetector(
        child: Text("Tap me"),
        onTap: ()=>print("Tap me"),
      ),
    );
  }
}

class GestureDemo2 extends StatefulWidget {
  GestureDemo2({Key key}) : super(key: key);

  @override
  _GestureDemo2State createState() => _GestureDemo2State();
}

class _GestureDemo2State extends State<GestureDemo2> {

  String shownText = "Alex";
  double fontsize = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gesture Demo"),
      ),
      body: Center(
        child: GestureDetector(
        child: Text(
            shownText,
            style: TextStyle(
              fontSize: fontsize,
            ),
          ),
          onDoubleTap: (){
            setState(() {
              this.shownText = this.shownText == "Alex" ? "Amy" : "Alex";
            });
          },
          onVerticalDragUpdate: (DragUpdateDetails v){
            var screenHeight = MediaQuery.of(context).size.height;
            var dragEnd = v.globalPosition.dy;
            var percentage = (dragEnd/screenHeight)*100;
            print(percentage);
            if(percentage > 20){
              setState(() {
                fontsize = percentage;
              });
            }
          },
        ),
      ),
    );
  }
}

class ListViewDemo extends StatefulWidget {
  ListViewDemo({Key key}) : super(key: key);

  @override
  _ListViewDemoState createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Setting Page"),
        leading: IconButton(icon: Icon(Icons.close), onPressed: ()=>Navigator.of(context).pop()),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: allAddedCities.length,
                itemBuilder: (BuildContext context, int index){
                  final city = allAddedCities[index];
                  return Dismissible(
                    key: ValueKey(city),
                    onDismissed: (DismissDirection dir){
                      if(dir == DismissDirection.endToStart){
                        allAddedCities.removeWhere((target) => city == target);
                      }
                    },
                    confirmDismiss: (DismissDirection dir) async{
                      return dir == DismissDirection.endToStart;
                    },
                    background: Container(
                      child: Icon(Icons.delete_forever),
                      decoration: BoxDecoration(color: Colors.red[700]),
                    ),
                    child: CheckboxListTile(
                      title: Text(city.name), 
                      onChanged: (bool value) {
                        setState(() {
                          city.checked = value;
                        });
                      }, 
                      value: city.checked,
                    ),
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class TabBarDemo extends StatefulWidget {

  final List<String> tabItems;
  final Function onTabChange;
  final int startIndex;

  TabBarDemo({Key key, this.tabItems, this.onTabChange, this.startIndex}) : super(key: key);

  @override
  _TabBarDemoState createState() => _TabBarDemoState();
}

class _TabBarDemoState extends State<TabBarDemo>  with SingleTickerProviderStateMixin{

  TabController _tabController;
  int activeTabIndex;

  @override
  void initState() {
    _tabController = TabController(
      length: widget.tabItems.length, 
      vsync: this,
      initialIndex: widget.startIndex
    );
    _tabController.addListener(handleTabChange);
    super.initState();
  }

  void handleTabChange(){
    if(_tabController.indexIsChanging) return;
    widget.onTabChange(_tabController.index);
    setState(() {
      activeTabIndex = _tabController.index;
      print("activeTabIndex is $activeTabIndex");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TabBarDemo"),
      ),
      body: Center(
        child: TabBar(
          labelColor: Colors.black,
          unselectedLabelColor: Colors.black38,
          unselectedLabelStyle: Theme.of(context).textTheme.caption.copyWith(fontSize: 20),
          labelStyle: Theme.of(context).textTheme.caption.copyWith(fontSize: 40),
          indicatorColor: Colors.transparent,
          labelPadding: EdgeInsets.all(20),
          controller: _tabController,
          tabs: widget.tabItems.map((t)=>Text(t)).toList(),
          isScrollable: true,
        ),
      ),
    );
  }
}

class PaddingDemo extends StatelessWidget {
  const PaddingDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.baseline,
        //erticalDirection: VerticalDirection.up,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(50),
            child: Text('Paddingd1'),
          ),
          Padding(
            padding: EdgeInsets.all(50),
            child: Text('Paddingd2'),
          ),
          Padding(
            padding: EdgeInsets.all(50),
            child: Text('Paddingd3'),
          ),
        ],
      )
    );
    
  }
}
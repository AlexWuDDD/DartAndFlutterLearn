import 'package:flutter/material.dart';
import 'package:weather/country.dart';
import 'package:weather/drop_down_field_expand.dart';

List<String> list = ['tab1', 'tab2', 'tab3', 'tab4', 'tab5'];

Function MyonTapChange(int index){
  print('Change to $index');
}

class City{
  String name;
  bool checked;
  int listIndex;
  Country country;

  City(this.name, {this.checked = false, this.listIndex, this.country});

   // 命名构造函数
  City.fromUserInput(){
    if(this.listIndex == null){
      this.listIndex = allAddedCities.length + 1;
    }
  }
}



List<City> allAddedCities = [
  City("Portland", listIndex: 0),
  City("Berlin", listIndex: 1), 
  City("Buenos Aires", listIndex: 2), 
  City("Chaing Mai", listIndex: 3), 
  City("Eugene", listIndex: 4), 
  City("Georgetown", listIndex: 5), 
  City("London", listIndex: 6),
  City("New York", listIndex: 7), 
  City("Panama City", listIndex: 8), 
  City("San Francisco", listIndex: 9), 
  City("Tokyo", listIndex: 10), 
];


class Test extends StatelessWidget {
  const Test({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //return PaddingDemo();
    return TabBarDemo(tabItems: list, onTabChange: MyonTapChange, startIndex: 0,);
    //return GestureDemo2();
    //return FormsDemo();
  }
}

class FormsDemo extends StatefulWidget {
  FormsDemo({Key key}) : super(key: key);

  @override
  _FormsDemoState createState() => _FormsDemoState();
}

class _FormsDemoState extends State<FormsDemo> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  City _newCity = City.fromUserInput();
  bool _isDefalutFlag = false;
  FocusNode focusNode;
  bool _formChanged = false;

  @override
  void initState() { 
    super.initState();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    focusNode.dispose();
    super.dispose();
  }

  void _onFormChange(){
    if(_formChanged) return;
    setState(() {
      _formChanged = true;
    });
  }

  void _handleAddNewCity() {
    final city = City(
      _newCity.name,
      country: _newCity.country,
      checked: true,
    );

    allAddedCities.add(city);
  }

  Future<bool> _onWillPop() {
    if (!_formChanged) return Future<bool>.value(true);
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
              content: Text("Are you sure you want to abandon the form? Any changes will be lost."),
              actions: <Widget>[
                FlatButton(
                  child: Text("Cancel"),
                  onPressed: () => Navigator.of(context).pop(false),
                  textColor: Colors.black,
                ),
                FlatButton(
                  child: Text("Abandon"),
                  textColor: Colors.red,
                  onPressed: () => Navigator.pop(context, true),
                ),
              ],
            ) ??
            false;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add City'),
        leading: Icon(Icons.keyboard_arrow_left),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          onChanged: _onFormChange,
          onWillPop: _onWillPop, //Called when the user is going to leave the page.
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  onSaved: (String val)=>_newCity.name = val,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    helperText: "Required",
                    labelText: "City name",
                  ),
                  autofocus: true,
                  autovalidate: _formChanged,
                  validator: (String val){
                    if(val.isEmpty) return "Filed cannot be left blank";
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  focusNode: focusNode,
                  onSaved: (String val)=> print(val),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    helperText: "Optional",
                    labelText: "State or Territory name",
                  ),
                  validator: (String val){
                    if(val.isEmpty){
                      return "Field cannot be left blank";
                    }
                    return null;
                  },
                ),
              ),
              CountryDropdownField(
                country: _newCity.country,
                onChanged: (newSelection){
                  setState(() {
                    _newCity.country = newSelection;
                  });
                },
              ),
              FormField(
                onSaved: (val)=>_newCity.checked = _isDefalutFlag,
                enabled: true,
                builder: (context){
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Default city?"),
                      Checkbox(
                        value: _isDefalutFlag, 
                        onChanged: (val){
                          setState(() {
                            _isDefalutFlag = val;
                          });
                        }
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
                      onPressed: ()async{
                        if(await _onWillPop()){
                          Navigator.of(context).pop(true);
                        }
                      }, 
                      child: Text('Cancel')
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: RaisedButton(
                      textColor: Colors.blue[400],
                      onPressed: _formChanged
                        ?(){
                          if(_formKey.currentState.validate()){
                            _formKey.currentState.save();
                            _handleAddNewCity();
                            Navigator.pop(context);
                          }
                          else{
                            FocusScope.of(context).requestFocus(focusNode);
                          }
                        }
                        :null, 
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

class CountryDropdownField extends StatelessWidget{

  final Function onChanged;
  final Country country;

  CountryDropdownField({this.onChanged, this.country});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: DropDownExpanded<Country>(
        isExpanded: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Country",
        ),
        value: country??Country.AD,
        onChanged: (Country newSelection)=>onChanged(newSelection),
        items: Country.ALL.map((Country country){
          return DropdownMenuItem(child: Text(country.name), value: country,);
        }).toList()

      ),
    );
  }
  
}
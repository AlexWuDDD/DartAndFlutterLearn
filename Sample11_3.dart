//接口
//定义一个DB库，支持mysql, mssql, mongdb
//三个类里都有同样的方法

abstract class Db{ //当做接口 接口就是约定
  String uri; //数据库连接地址
  add(String data);
  save();
  delete();
}

class Mysql implements Db{
  @override
  add(String data) {
    // TODO: implement add
    print('这是MySql数据库的add' + data);
  }

  @override
  delete() {
    // TODO: implement delete
    return null;
  }

  @override
  save() {
    // TODO: implement save
    return null;
  }

  @override
  String uri;
  Mysql(this.uri);
  
}

class MsSql implements Db{
  @override
  add(String data) {
    // TODO: implement add
    return null;
  }

  @override
  delete() {
    // TODO: implement delete
    return null;
  }

  @override
  save() {
    // TODO: implement save
    return null;
  }

  @override
  String uri;
  
}

void main(){
  Db mysql = new Mysql('xxxxxx');
  mysql.add('YYYYYYYYYY');
}
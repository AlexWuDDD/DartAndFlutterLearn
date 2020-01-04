//泛型接口
// abstract class ObjectCache{
//   getByKey(String key);
//   void setByKey(String key, Object value);
// }

// abstract class StringCache{
//   getNByKey(String key);
//   void setByKey(String key, String value);
// }

// abstract class Cache<T>{
//   getByKey(String key);
//   void setByKey(String key, T value);
// }


abstract class Cache<T>{
  getByKey(String key);
  void setByKey(String key, T value);
}

class FileCache<T> implements Cache<T>{
  @override
  getByKey(String key) {
    return null;
  }

  @override
  void setByKey(String key, T value) {
    print('我是文件缓存');
  }

}

class MemoryCache<T> implements Cache<T>{
  @override
  getByKey(String key) {
    return null;
  }

  @override
  void setByKey(String key, T value) {
    print('我是内存缓存');
  }

}


void main(){

}
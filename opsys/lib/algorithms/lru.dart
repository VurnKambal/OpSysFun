import 'dart:collection';

void main() {
  // Driver code
  int cacheSize = 3;
  List<int> processes = [1, 2, 3, 1, 4, 5];
  LRUCache.main(cacheSize, processes);
}

class LRUCache {
  // store keys of cache
  final List _doublyQueue = [];

  // store references of key in cache
  final HashSet _hashSet = HashSet<int>();

  // maximum capacity of cache
  int _cacheSize = 0;

  LRUCache(int capacity) {
    _cacheSize = capacity;
  }

  /* Refer the page within the LRU cache */
  void refer(int page) {
    // Most Recently Used Page Reference
    // If page exists in the cache
    if (!_hashSet.contains(page)) {
      // Check if the queue is full
      if (_doublyQueue.length == _cacheSize) {
        int last = _doublyQueue[_doublyQueue.length - 1];

        // Animate? Least Recently Used Page Removal
        _doublyQueue.removeAt(_doublyQueue.length - 1);
        _hashSet.remove(last);
      }
    } else {
      /* The found page may not be always the last
               element, even if it's an intermediate
               element that needs to be removed and added
               to the start of the Queue */

      // Animate? Moving the page to the front of the queue if it exists
      _doublyQueue.remove(page);
    }

    // Animate? Most Recently Used Page Insertion
    _doublyQueue.insert(0, page);
    _hashSet.add(page);
    print(_doublyQueue);
    print(_hashSet);
  }

  // display contents of cache
  void display() {
    for (int page in _doublyQueue) {
      print("$page ");
    }
  }

  // Driver code
  static void main(int cacheSize, List<int> processes) {
    LRUCache cache = LRUCache(cacheSize);
    for (int process in processes) {
      cache.refer(process);
    }
    cache.display();
  }
}
 

// C# code by phasing17 : https://www.geeksforgeeks.org/lru-cache-implementation/
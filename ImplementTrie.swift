/*
Implement a trie with insert, search, and startsWith methods.

Example:

Trie trie = new Trie();

trie.insert("apple");
trie.search("apple");   // returns true
trie.search("app");     // returns false
trie.startsWith("app"); // returns true
trie.insert("app");   
trie.search("app");     // returns true
Note:

You may assume that all inputs are consist of lowercase letters a-z.
All inputs are guaranteed to be non-empty strings.
*/

/* This solution is based on the RW Article: https://www.raywenderlich.com/892-swift-algorithm-club-swift-trie-data-structure
*/

class TrieNode<T: Hashable> {
    var value: T? 
    var isEnding: Bool = false
    weak var parent: TrieNode?
    var children: [T:TrieNode] = [:]
    
    init(_ value: T? = nil, _ parent: TrieNode? = nil) {
        self.value = value
        self.parent = parent
    }
    
    func add(child: T) {
        guard children[child] == nil else { return }
        children[child] = TrieNode(child,self)
    }
    
}


class Trie {
    
    typealias Node = TrieNode<String>
    fileprivate let root: Node 
    

    /** Initialize your data structure here. */
    init() {
        root = TrieNode<String>()
        
    }
    
    /** Inserts a word into the trie. */
    func insert(_ word: String) {
        guard !word.isEmpty else {return }
        var currentNode = root
        let strArr = word.map { String($0) }
        var currIdx = 0
        while(currIdx < word.count) {
            let strAtIdx = strArr[currIdx]
            
            //If child already exits; change current node
            if let child = currentNode.children[strAtIdx] {
                currentNode = child
            } else { //if child doesn't exist, create the child and move the pointer
                //print("Adding child for str:",strAtIdx)
                currentNode.add(child: strAtIdx)
                currentNode = currentNode.children[strAtIdx]!
            }
            
            currIdx += 1
            
            if(currIdx==word.count) {
                currentNode.isEnding = true
            }
        }
    }
    
    /** Returns if the word is in the trie. */
    func search(_ word: String) -> Bool {
        guard !word.isEmpty else { return false }
        var currentNode = root
    
        let strArr = word.map { String($0)}
        var currentIndex = 0
    
        while currentIndex < strArr.count, let child = currentNode.children[strArr[currentIndex]] {
            currentIndex += 1
            currentNode = child
        }
    
        if currentIndex == strArr.count && currentNode.isEnding {
            return true
        } else {
            return false
        }
    }
    
    /** Returns if there is any word in the trie that starts with the given prefix. */
    func startsWith(_ prefix: String) -> Bool {
        guard !prefix.isEmpty else { return false }
        var currentNode = root
    
        let strArr = prefix.map { String($0)}
        var currentIndex = 0
    
        while currentIndex < strArr.count, let child = currentNode.children[strArr[currentIndex]] {
            currentIndex += 1
            currentNode = child
        }
        
        if(currentIndex == prefix.count) {
            return true
        }
        else {
            return false
        }
    }
}

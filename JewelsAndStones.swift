/*
You're given strings J representing the types of stones that are jewels, and S representing the stones you have.  Each character in S is a type of stone you have.  You want to know how many of the stones you have are also jewels.

The letters in J are guaranteed distinct, and all characters in J and S are letters. Letters are case sensitive, so "a" is considered a different type of stone from "A".

Example 1:

Input: J = "aA", S = "aAAbbbb"
Output: 3
Example 2:

Input: J = "z", S = "ZZ"
Output: 0
Note:

S and J will consist of letters and have length at most 50.
The characters in J are distinct.
*/

class Solution {
    func numJewelsInStones(_ J: String, _ S: String) -> Int {
        var jewelHash = [String:Int]()
        var numJewels = 0
        var jArr = J.map { String($0) }
        var sArr = S.map { String($0) }
        
        for i in 0..<jArr.count { 
            jewelHash[jArr[i]] = 1
        }
        
        for i in 0..<sArr.count { 
            var stone = sArr[i]
            let keyExists = jewelHash[stone] != nil
            if(keyExists) {
                numJewels += 1
            }
        }
        
        return numJewels
    }
}

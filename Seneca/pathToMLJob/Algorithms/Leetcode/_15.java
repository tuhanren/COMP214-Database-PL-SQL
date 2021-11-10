//3Sum
// find a + b + c = 0, hence, can be treated as a + b = -c, 2Sum

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

class Solution {
    public List<List<Integer>> threeSum(int[] nums) {
        // one pass to test the nums
        int minVal = Integer.MAX_VALUE;
        int maxVal = Integer.MIN_VALUE;
        
        int posNums = 0;
        int negNums = 0;
        int zeroNums = 0;
        
        // result
        List<List<Integer>> result = new ArrayList<>();
        
        // fist pass of nums
        for(int num : nums){
            if(num < minVal)
                minVal = num;
            if(num > maxVal) maxVal = num;
            if(num == 0)
               zeroNums++
            
        }
    }
}
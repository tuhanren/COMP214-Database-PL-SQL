// leetcode 122, Best Time to Buy and Sell Stock II
// multiple buy and sell, stock max profit

class Solution {
    public int maxProfit(int[] prices) {
        // one pass, add consecutive increment, updates on peak and valley
        int maxprofit = 0;
        // boudary issue, i = 0, i and i + 1, i = 1, i and i - 1
        for(int i = 0; i < prices.length - 1; i ++){
            if(prices[i] < prices[i + 1])
                maxprofit += prices[i + 1] - prices[i];
        }
        return maxprofit;
    }
}
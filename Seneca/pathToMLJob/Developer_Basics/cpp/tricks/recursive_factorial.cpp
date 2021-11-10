#include <iostream>
using namespace std;
long int factorial(size_t n);

long int factorial(size_t n) {
	if (n <= 1) {
		return 1;
	}
	return n * factorial(n - 1);
}

int main () {
  size_t num;
  long int res;
  cout << "Please enter a positive integer: " << endl;
  cin >> num;
  res = factorial (num);
  cout << "The factorial of the integer: " << res  << endl;
  return 0;
}





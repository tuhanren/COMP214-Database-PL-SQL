#include<iostream>
#include<string>
#include<vector>

using namespace std;

// tasks.json to build multiple 
// C++ files by using an argument like "${workspaceFolder}/*.cpp" instead of ${file}.

int main()
{
    vector<string> msg {"Hello", "C++", "world","from","VS Code", "and the C++ extension!"};
    for (const string& word : msg)
    {
        cout << word << " ";
    }
    cout << endl;
}  
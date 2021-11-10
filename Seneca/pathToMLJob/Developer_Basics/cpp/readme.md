# C++ and OOP

Using C++ 17

## Prepare Working Environment
  
### Compiler for C++17 on Ubuntu 16.04 LTS

Using Ubuntu 16.04 with multiple versions of GCC and G++ compiler.
Get valgrind degubber to track the memory allocations.

    gcc --version          # or gcc -v 
    ls /usr/bin/gcc*       # view all versions of gcc installed
    ls /usr/bin/g++*       # for g++
    # Using this repository 
    sudo add-apt-repository ppa:ubuntu-toolchain-r/test
    sudo apt-get update
    sudo apt-get install gcc-9 g++-9
    # set different priorities for diff versions of GCC
    # the last number: priority, larger means preferred   
    # using --remove to undo: sudo update-alternatives --remove gcc /usr/bin/gcc-9
    sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 5 
    sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-5 5
    sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 9
    sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-9 9
    # show all config
    sudo update-alternatives --config gcc
    sudo update-alternatives --config g++
    g++ --version
    gcc --version
    # Done!
    # using upate-alternatives --config to switch later on
    ## valgrind
    sudo apt-get install valgrind

### VS Code, C/C++ extension and Debugger 

Based on [C++ on Linux in VS Code](https://code.visualstudio.com/docs/cpp/config-linux).

In general:

- All configuration .json files to build .cpp are in .vscode folder under the main working directory.
- Press <kbd>control + shift + B</kbd><br> to build .cpp file with **tasks.json**.
- In a new terminal, run the executable file by typing ./**name**.

To debug:

- **Run > Add Configuration...** and then choose **C++ (GDB/LLDB)**.
- Choose **g++ build and debug active file**.
- In **launch.json**, set *stopAtEntry* to *true*.
- Press <kbd>F5</kbd> to begin debug, use **Step over**, **breakpoint**, **watch** and **Step into** etc. to facilitate debugging process. 

## Part 1 OOP workshop

### Workshop1

Design a calender with inner clock, taking .txt input with event and output events by time and event states.

## Part 2 Linkedin C++ Dev

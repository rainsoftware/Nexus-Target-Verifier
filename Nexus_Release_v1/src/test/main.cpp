#include <iostream>
#include <fstream>
#include <cstdlib>

int main() {
    std::string filename = "../../src/test/build/Nexus-1.0-linux.tar.gz";
    std::string command = "tar -tzf " + filename + " > /dev/null"; 
    int result = std::system(command.c_str()); // 

    if (result == 0) {
        std::cout << "The file " << filename << " is valid." << std::endl;
    } else {
        std::cout << "The file " << filename << " is invalid." << std::endl;
    }

    return 0;
}

#include <iostream>
#include <list>
#include <algorithm>

using namespace std;

int main(int argc, const char *argv[])
{
    string haystack("abcdefghijkl");
    string needle("cd");
    size_t res = haystack.find(needle);
    if (res != string::npos) 
        haystack.insert(res + needle.size(), "XX");
    cout << haystack << endl;
    return 0;
}

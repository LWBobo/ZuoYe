#include<iostream>
#include<fstream>
#include<string>
#include <vector>


using namespace std;
int main(int argv, char *arg[])
{

 fstream f("C:\\Users\\Administrator\\Documents\\Tencent Files\\1697668797\\FileRecv\\a.txt");
    string line;
    char * str;
    while (getline(f, line))
    {
        str = (char *)line.c_str() ;
    for(int i = 0 ; str[i] != '\0' ; i++)
    {
        cout << str[i] ;
    }
    cout << endl;



}

    return 0;
}

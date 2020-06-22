#include "Output.hpp"
#include "Pars.hpp"
int i = 0;
const int k = 3;
int a;
int b;
int c;
string namef;

int main()
{
    figure circle[k];
    circle[0].setNZero();
    string str;
    for (int j = 0; j < k; j++) {
        getline(cin, str);
        namef = partStr(str);
        if (namef == "circle") {
            if (str[i] == '(')
                i++;
            a = partStr2(str);
            b = partStr2(str);
            c = partStr2(str);
            circle[j].setName(namef);
            circle[j].setCoord(a, b, c);
            circle[j].setN(j + 1);
        } else
            j--;
        i = 0;
    }
    outputF(circle, k);
}

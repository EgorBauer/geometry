#include "Pars.hpp"

void skipspace(string a)
{
    while (a[i] == ' ')
        i++;
}

string partStr(string a)
{
    string strt;
    while (a[i] != '(') {
        if (a[i] == '\0')
            break;
        i++;
    }
    strt.resize(i);
    copy(a.begin(), a.begin() + i, strt.begin());

    return strt;
}

int partStr2(string a)
{
    int p = strlen(a.c_str());
    string strt = a;
    strt.resize(p);
    strt = strt.substr(i);
    int k = atoi(strt.c_str());
    while (isdigit(a[i])) {
        i++;
    }
    while (isdigit(a[i]) == 0 && i < p) {
        i++;
    }
    return k;
}

#include "Figure.hpp"

class figure {
private:
    int N;
    string name;
    int x;
    int y;
    int r;

public:
    void setNZero()
    {
        N = 0;
    }
    void setN(int a)
    {
        N = a;
    }
    void output()
    {
        cout << N << '.' << ' ' + name << '(' << x << ' ' << y << ',' << r << ')' << endl;
    }
    void setName(string a)
    {
        name = a;
    }
    void setCoord(int a, int b, float c)
    {
        x = a;
        y = b;
        r = c;
    }
    figure()
    {
        setCoord(1, 2, 3);
    }
    friend void outputF(figure* circle, int k);
};

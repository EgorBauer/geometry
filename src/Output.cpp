#include "Output.hpp"

int sqr(int a)
{
    return a * a;
}

void outputF(figure* circle, int k)
{
    for (int j = 0; j < k; j++) {
        circle[j].output();
        cout << "\tPerimetr = " << 2 * Pi * circle[j].r << endl
             << "\tArea = " << Pi * circle[j].r * circle[j].r << endl;
        cout << "\tIntersects:" << endl;
        for (int l = 0; l < k; l++) {
            if (j == l)
                continue;
            if (sqrt(sqr(circle[j].x - circle[l].x)
                     + sqr(circle[j].y - circle[l].y))
                < (circle[j].r + circle[l].r)) {
                cout << "\t\t";
                circle[l].output();
                cout << endl;
            }
        }
        cout << endl;
    }
}

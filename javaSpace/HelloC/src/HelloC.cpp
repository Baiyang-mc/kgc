//============================================================================
// Name        : HelloC.cpp
// Author      : baiyang
// Version     :
// Copyright   : Your copyright notice
// Description : Hello World in C++, Ansi-style
//============================================================================

#include <iostream>
#include <list>
#include <algorithm>
#include <time.h>
#include <string.h>
#define MAX 1000
#define N 30
using namespace std;
typedef list<int> LISTINT;

int main()
{
    LISTINT::iterator iter;
    int a[N];
    srand(time(NULL));

    for(int i =0;i < N; i++)
        a[i] = rand()%MAX;
    for(int i = 0;i < N; i++)
        cout << a[i] << " ";
    cout << endl;

    LISTINT *listAll = new LISTINT[N];
    int index[N];
    memset(index, 0, sizeof(index));

    for(int i = 0; i < N; i++)
    {
        int temp = a[i]*N / MAX;
        if(index[temp]==0)
        {
            index[temp] = 1;
            listAll[temp].push_back(a[i]);
        }else{
            listAll[temp].push_back(a[i]);
            listAll[temp].sort();
        }
    }
    for(int i = 0; i < N; i++)
    {
        if(index[i] != 0)
            for(iter = listAll[i].begin(); iter != listAll[i].end(); ++iter)
                cout << *iter << " ";
    }
    cout << endl;
    delete(listAll);
    return 0;
}

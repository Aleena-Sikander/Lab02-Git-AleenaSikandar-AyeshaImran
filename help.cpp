#include <iostream>
int ntri(int num){
    if (num<=1){
        return 1;
    }
    return num + ntri(num-1);
}

long long fibonaci_recursive(int n) {
    if (n <= 1) {
        return n;
    }
    return fibonaci_recursive(n - 1) + fibonaci_recursive(n - 2);
}
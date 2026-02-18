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

void bubble(int *a, unsigned int size){
    if(a=NULL || size == 0){
        return;
    }
    for (int i = 0; i < size - 1; i++) {
        for (int j = i; j < size; j++) {
            if (a[i] < a[j]) {
                int temp = a[i];
                a[i] = a[j];
                a[j] = temp;
            }
        }
    }
    return;
}
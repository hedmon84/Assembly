#include <stdio.h>
int arraySum(int a[], int size)
{
    int sum = 0;
    for (int i = 0; i < size; i++)
    {
        sum += a[i]; // a + i*4
    }
    return sum;
}

int main()
{
    int a[] = {10, 20, 30};
    int sum = arraySum(a, 3);
    printf("%d\n", sum);
}
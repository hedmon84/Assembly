//#include <stdio.h>

void quicksort(int number[], int first, int last)
{
    if (first < last)
    {
        int pivot = first;
        int i = first;
        int j = last;

        while (i < j)
        {
            while (number[i] <= number[pivot] && i < last)
                i++;
            while (number[j] > number[pivot])
                j--;

            if (i < j)
            {
                int temp = number[i];
                number[i] = number[j];
                number[j] = temp;
            }
        }

        int temp = number[pivot];
        number[pivot] = number[j];
        number[j] = temp;
        quicksort(number, first, j - 1);
        quicksort(number, j + 1, last);
    }
}

int main()
{
    int number[] = {43, 17, 46, 15, 78, 35, 60, 61, 3, 51, 5, 92, 5};
    int count = sizeof(number) / sizeof(number[0]);

    quicksort(number, 0, count - 1);

    printf("Sorted array: ");
    for (int i = 0; i < count; i++)
    {
        printf("%d ", number[i]);
    }
    printf("\n");

    return 0;
}
